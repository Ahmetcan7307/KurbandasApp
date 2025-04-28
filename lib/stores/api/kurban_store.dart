import 'package:kurbandas/core/domain/entities/kurban.dart';
import 'package:kurbandas/core/domain/entities/kurban_request.dart';
import 'package:kurbandas/core/models/filter.dart';
import 'package:kurbandas/injector.dart';
import 'package:kurbandas/services/api/kurban_service.dart';
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

  KurbanService service = serviceLocator.get<KurbanService>();

  @action
  Future getAnimals() async => animals ??= await service.getAnimals();

  @action
  createFilter(
      {KurbanAnimal? animal, int? selectedProvince, int? selectedDistrict}) {
    filter ??= Filter();
    filter!.animal = animal;
    filter!.selectedProvince = selectedProvince;
    filter!.selectedDistrict = selectedDistrict;
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
}
