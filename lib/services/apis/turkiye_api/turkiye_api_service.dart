import 'package:dio/dio.dart';
import 'package:kurbandas/services/apis/turkiye_api/turkiye_api.dart';

import '../../../core/domain/entities/turkiye_api_province.dart';

class TurkiyeAPIService {
  final Dio dio;

  TurkiyeAPIService({required this.dio});

  Future<List<TurkiyeAPIProvince>> getProvinces() async {
    try {
      Response<Map<String, dynamic>> response = await dio
          .get<Map<String, dynamic>>(TurkiyeAPI.getUrl(Controllers.province));

      if (response.statusCode == 200) {
        return (response.data!["data"] as List)
            .map((dynamic data) => TurkiyeAPIProvince.fromJson(data))
            .toList();
      }

      throw TurkiyeAPI.getError(response);
    } on DioException catch (e) {
      throw TurkiyeAPI.getDioException(e);
    }
  }
}
