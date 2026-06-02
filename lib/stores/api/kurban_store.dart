// ignore_for_file: use_build_context_synchronously
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kurbandas/core/const/my_api/kurban_request_service.dart';
import 'package:kurbandas/core/const/my_api/kurban_service.dart';
import 'package:kurbandas/core/domain/entities/address.dart';
import 'package:kurbandas/core/domain/entities/kurban.dart';
import 'package:kurbandas/core/domain/entities/kurban_request.dart';
import 'package:kurbandas/core/domain/entities/turkiye_api_district.dart';
import 'package:kurbandas/core/domain/entities/turkiye_api_province.dart';
import 'package:kurbandas/core/domain/entities/user.dart';
import 'package:kurbandas/core/exceptions/file_too_large_exception.dart';
import 'package:kurbandas/core/models/filter.dart';
import 'package:kurbandas/generated/l10n.dart';
import 'package:kurbandas/injector.dart';
import 'package:kurbandas/services/image_picker_service.dart';
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

  @observable
  String? selectedKurbanDocumentId;

  ImagePickerService imagePickerService =
      serviceLocator.get<ImagePickerService>();

  int pageSize = 10;

  @action
  void getAnimals() => animals ??= KurbanService.getAnimals();

  @action
  void createFilter(
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
  Future getMyKurbans() async => myKurbans = KurbanService.getMyKurbans;

  @action
  void getRequests() => requests = KurbanRequestService.getRequests;

  @action
  void approveOrDeclineRequest(String documentId, bool isApprove) => requests!
      .removeWhere((kurbanRequest) => kurbanRequest.documentId == documentId);

  @action
  void delete(String documentId) =>
      myKurbans!.removeWhere((kurban) => kurban.documentId == documentId);

  @action
  Future updateKurban() async {
    int indexWhere =
        myKurbans!.indexWhere((kurban) => kurban == selectedKurban);
    myKurbans![indexWhere] = selectedKurban!;
  }

  @action
  void getMyPartnerships() => myPartnerships = KurbanService.getMyPartnerships;

  @action
  Null clearFilter() => filter = null;

  @action
  bool getActiveKurbans(int page) {
    List<Kurban> newKurbans = KurbanService.getKurbans(true, filter);
    if (page == 1) {
      activeKurbans.clear();
    }
    activeKurbans.addAll(newKurbans);
    return newKurbans.length < pageSize;
  }

  @action
  bool getDeactiveKurbans(int page) {
    List<Kurban> newKurbans = KurbanService.getKurbans(false, filter);
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
  void clearKurbanses() {
    activeKurbans.clear();
    deactiveKurbans.clear();
  }

  @action
  void selectKurban(bool isMy, bool isActive, int index) {
    if (isMy) {
      selectedKurbanDocumentId = myKurbans![index].documentId;
    } else {
      selectedKurbanDocumentId = isActive
          ? activeKurbans.elementAt(index).documentId!
          : deactiveKurbans.elementAt(index).documentId!;
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

  bool isRequestSend() => false;

  void sendRequest() {
    return;
  }

  @action
  Future create() async {
    selectedPhotos.clear();
  }

  @action
  void selectNewKurbanAnimal(KurbanAnimal animal) {
    if (newKurban == null) {
      newKurban = Kurban(animal: animal);
    } else {
      newKurban!.animal = animal;
    }
  }

  @action
  Address selectNewKurbanProvince(TurkiyeAPIProvince province) =>
      newKurban!.address = Address(province: province);

  @action
  Future pickImage(ImageSource source) async {
    File? selectedPhoto = await imagePickerService.pickImage(source);
    if (selectedPhoto != null) {
      selectedPhotos.add(selectedPhoto);
    }
  }

  @action
  File removePhoto(int index) => selectedPhotos.removeAt(index);

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

      for (File photo in photos) {
        int length = await photo.length();
        if (length > 5000000) {
          throw FileTooLargeException();
        }
      }
      selectedPhotos.addAll(photos);
      return true;
    }

    return false;
  }

  @action
  TurkiyeAPIProvince selectSelectedKurbanProvince(
          TurkiyeAPIProvince province) =>
      selectedKurban!.address!.province = province;

  @computed
  int get totalPhotosCount =>
      selectedKurban!.photoUrls!.length + selectedPhotos.length;

  @action
  void removePhotoUrl(int index) {
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

  @action
  void get(bool isEdit, {User? user}) => selectedKurban =
      KurbanService.get(selectedKurbanDocumentId!, isEdit, user: user);

  @action
  void nullSelectedKurban() => selectedKurban = null;

  @action
  void selectPartnership(String documentId) =>
      selectedKurbanDocumentId = documentId;
}
