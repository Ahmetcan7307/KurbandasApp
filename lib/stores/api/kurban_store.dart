// ignore_for_file: use_build_context_synchronously
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kurbandas/core/const/storage_cons.dart';
import 'package:kurbandas/core/domain/entities/address.dart';
import 'package:kurbandas/core/domain/entities/kurban.dart';
import 'package:kurbandas/core/domain/entities/kurban_request.dart';
import 'package:kurbandas/core/domain/entities/turkiye_api_district.dart';
import 'package:kurbandas/core/domain/entities/turkiye_api_province.dart';
import 'package:kurbandas/core/models/filter.dart';
import 'package:kurbandas/generated/l10n.dart';
import 'package:kurbandas/injector.dart';
import 'package:kurbandas/services/apis/my_api/kurban_service.dart';
import 'package:kurbandas/services/image_picker_service.dart';
import 'package:kurbandas/services/supabase/storage_service.dart';
import 'package:mobx/mobx.dart';

import '../../core/utils/components/my_snackbar.dart';

part 'kurban_store.g.dart';

class KurbanStore = _KurbanStore with _$KurbanStore;

abstract class _KurbanStore with Store {
  @observable
  List<KurbanAnimal>? animals;

  @observable
  Filter? filter;

  @observable
  List<Kurban>? myKurbans;

  @observable
  List<KurbanRequest>? requests;

  @observable
  List<Kurban>? myPartnerships;

  @observable
  Set<Kurban> activeKurbans = ObservableSet();

  @observable
  Set<Kurban> deactiveKurbans = ObservableSet();

  @observable
  Kurban? selectedKurban;

  @observable
  Kurban? newKurban;

  @observable
  List<File> selectedPhotos = ObservableList.of([]);

  KurbanService service = serviceLocator.get<KurbanService>();
  ImagePickerService imagePickerService =
      serviceLocator.get<ImagePickerService>();
  StorageService storageService = serviceLocator.get<StorageService>();

  int pageSize = 10;

  @action
  Future getAnimals() async => animals ??= await service.getAnimals();

  @action
  createFilter(
      {KurbanAnimal? animal,
      TurkiyeAPIProvince? selectedProvince,
      TurkiyeAPIDistrict? selectedDistrict}) {
    filter ??= Filter();
    filter!.animal = animal;
    filter!.selectedProvince = selectedProvince;
    filter!.selectedDistrict = selectedDistrict;

    clearKurbanses();
  }

  @action
  Future getMyKurbans() async => myKurbans = await service.getMyKurbans();

  @action
  Future getRequests() async =>
      requests = await service.getRequests(selectedKurban!.documentId!);

  @action
  Future approveOrDeclineRequest(String documentId, bool isApprove) async =>
      requests = await service.approveOrDeclineRequest(documentId, isApprove);

  @action
  Future<List<Kurban>> delete(String documentId) async =>
      myKurbans = await service.delete(documentId);

  @action
  Future updateKurban() async {
    for (File photo in selectedPhotos) {
      String path =
          "${selectedKurban!.documentId}/${DateTime.now().millisecondsSinceEpoch}.${photo.path.split("/").last.split(".").last}";
      await storageService.uploadFile(
          StorageCons.kurbansBucketName, path, photo);

      selectedKurban!.photoUrls!.add(
          storageService.getPublicUrl(StorageCons.kurbansBucketName, path));
    }

    await service.put(selectedKurban!.toJson());

    int indexWhere =
        myKurbans!.indexWhere((kurban) => kurban == selectedKurban);
    myKurbans![indexWhere] = selectedKurban!;
  }

  @action
  Future getMyPartnerships() async =>
      myPartnerships = await service.getMyPartnerships();

  @action
  clearFilter() => filter = null;

  @action
  Future<bool> getActiveKurbans(int page) async {
    List<Kurban> newKurbans =
        await service.getKurbans(true, filter, page, pageSize);
    activeKurbans.addAll(newKurbans);
    return newKurbans.length < pageSize;
  }

  @action
  Future<bool> getDeactiveKurbans(int page) async {
    List<Kurban> newKurbans =
        await service.getKurbans(false, filter, page, pageSize);
    deactiveKurbans.addAll(newKurbans);
    return newKurbans.length < pageSize;
  }

  int getKurbansLength(bool isActive) {
    if (isActive) {
      return activeKurbans.length;
    }
    return deactiveKurbans.length;
  }

  @action
  clearKurbanses() {
    activeKurbans.clear();
    deactiveKurbans.clear();
  }

  @action
  selectKurban(bool isMy, bool isActive, int index) {
    if (isMy) {
      selectedKurban = myKurbans![index];
    } else {
      selectedKurban = isActive
          ? activeKurbans.elementAt(index)
          : deactiveKurbans.elementAt(index);
    }
  }

  String getKurbanStatus(S lang, {KurbanStatus? kurbanStatus}) =>
      switch (kurbanStatus ?? selectedKurban!.status!) {
        KurbanStatus.waiting => lang.waiting,
        KurbanStatus.cut => lang.cut,
        KurbanStatus.shared => lang.shared,
      };

  Color getStatusColor({KurbanStatus? status}) =>
      switch (status ?? selectedKurban!.status!) {
        KurbanStatus.waiting => Colors.orange,
        KurbanStatus.cut => Colors.blue,
        KurbanStatus.shared => Colors.green,
      };

  Future<bool> isRequestSend() async =>
      await service.isRequestSend(selectedKurban!.documentId!);

  Future postRequest() async =>
      await service.postRequest(selectedKurban!.documentId!);

  @action
  Future create() async {
    String documentId = await service.post(newKurban!.toJson());
    newKurban!.clear();

    newKurban!.documentId = documentId;
    newKurban!.photoUrls = [];
    for (File photo in selectedPhotos) {
      String path =
          "$documentId/${DateTime.now().millisecondsSinceEpoch}.${photo.path.split("/").last.split(".").last}";
      await storageService.uploadFile(
          StorageCons.kurbansBucketName, path, photo);

      newKurban!.photoUrls!.add(
          storageService.getPublicUrl(StorageCons.kurbansBucketName, path));
    }

    await service.put(newKurban!.toJson());

    newKurban = null;
    selectedPhotos.clear();
  }

  @action
  selectNewKurbanAnimal(KurbanAnimal animal) {
    newKurban ??= Kurban(animal: animal);
  }

  @action
  selectNewKurbanProvince(TurkiyeAPIProvince province) =>
      newKurban!.address ??= Address(province: province);

  @action
  Future pickImage(ImageSource source) async {
    File? selectedPhoto = await imagePickerService.pickImage(source);
    if (selectedPhoto != null) {
      selectedPhotos.add(selectedPhoto);
    }
  }

  @action
  removePhoto(int index) => selectedPhotos.removeAt(index);

  @action
  Future<bool> pickMultiImage() async {
    List<File>? photos = await imagePickerService.pickMultiImage();
    if (photos != null) {
      // Toplam fotoğraf sayısı 7'yi geçmeyecek şekilde ekleyelim
      int remaingSlots = 7 -
              (selectedPhotos.length +
                  (selectedKurban != null
                      ? selectedKurban!.photoUrls!.length
                      : 0)),
          photosToAdd =
              photos.length > remaingSlots ? remaingSlots : photos.length;
      if (photosToAdd < photos.length) {
        return false;
      }

      selectedPhotos.addAll(photos);
      return true;
    }

    return false;
  }

  @action
  selectSelectedKurbanProvince(TurkiyeAPIProvince province) =>
      selectedKurban!.address!.province = province;

  @computed
  int get totalPhotosCount =>
      selectedKurban!.photoUrls!.length + selectedPhotos.length;

  @action
  removePhotoUrl(int index) {
    selectedKurban!.removedPhotoUrls ??= [];
    selectedKurban!.removedPhotoUrls!
        .add(selectedKurban!.photoUrls!.removeAt(index));
  }

  @action
  Future getImages(BuildContext context, S lang, ImageSource source) async {
    // Maksimum 7 fotoğraf sınırı
    if (selectedPhotos.length >= 7) {
      showSnackBar(context, text: lang.canAdd7Photos, color: Colors.red);
      return;
    }

    if (source == ImageSource.camera) {
      await pickImage(source);
    } else {
      if (!(await pickMultiImage())) {
        showSnackBar(context, text: lang.canAdd7Photos, color: Colors.orange);
      }
    }
  }
}
