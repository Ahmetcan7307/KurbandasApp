import 'package:kurbandas/core/domain/entities/kurban.dart';
import 'package:kurbandas/core/domain/entities/kurban_request.dart';
import 'package:kurbandas/core/domain/entities/turkiye_api_district.dart';
import 'package:kurbandas/core/domain/entities/turkiye_api_province.dart';
import 'package:kurbandas/core/models/filter.dart';
import 'package:kurbandas/injector.dart';
import 'package:kurbandas/services/apis/my_api/kurban_service.dart';
import 'package:mobx/mobx.dart';

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
  Kurban? selectedKurban;

  @observable
  List<KurbanRequest>? requests;

  @observable
  List<Kurban>? myPartnerships;

  @observable
  Set<Kurban> allKurbans = ObservableSet();

  @observable
  Set<Kurban> activeKurbans = ObservableSet();

  @observable
  Set<Kurban> deactiveKurbans = ObservableSet();

  KurbanService service = serviceLocator.get<KurbanService>();

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
  selectMyKurban(int index) => selectedKurban = myKurbans![index];

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
  Future getMyPartnerships() async =>
      myPartnerships = await service.getMyPartnerships();

  @action
  clearFilter() => filter = null;

  @action
  Future<bool> getAllKurbans(int page) async {
    List<Kurban> newKurbans =
        await service.getKurbans(null, filter, page, pageSize);
    allKurbans.addAll(newKurbans);
    return newKurbans.length < pageSize;
  }

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

  int getKurbansLength(bool? isActive) {
    if (isActive == null) {
      return allKurbans.length;
    } else if (isActive) {
      return activeKurbans.length;
    }
    return deactiveKurbans.length;
  }

  @action
  clearKurbanses() {
    allKurbans.clear();
    activeKurbans.clear();
    deactiveKurbans.clear();
  }
}
