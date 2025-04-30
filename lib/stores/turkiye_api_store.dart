import 'package:kurbandas/core/domain/entities/turkiye_api_district.dart';
import 'package:kurbandas/core/domain/entities/turkiye_api_province.dart';
import 'package:kurbandas/injector.dart';
import 'package:kurbandas/services/apis/turkiye_api/turkiye_api_service.dart';
import 'package:mobx/mobx.dart';

part 'turkiye_api_store.g.dart';

class TurkiyeAPIStore = _TurkiyeAPIStore with _$TurkiyeAPIStore;

abstract class _TurkiyeAPIStore with Store {
  @observable
  List<TurkiyeAPIProvince>? provinces;

  @observable
  List<TurkiyeAPIDistrict>? districts;

  TurkiyeAPIService service = serviceLocator.get<TurkiyeAPIService>();

  @action
  Future getProvince() async => provinces ??= await service.getProvinces();

  @action
  selectProvince(int id) => districts =
      provinces!.where((province) => province.id == id).first.districts;
}
