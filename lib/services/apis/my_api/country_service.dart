import 'package:dio/dio.dart';
import 'package:kurbandas/core/domain/entities/country_code.dart';
import 'package:kurbandas/services/apis/my_api/my_api.dart';

class CountryService {
  final Dio dio;

  CountryService(this.dio);

  Future<List<CountryCode>> getAll() async {
    String url = MyAPI.getUrl(Controllers.countryCodes, "GetAll");
    Response<List> response = await dio.get(url);

    if (response.statusCode == 200) {
      return response.data!.map((data) => CountryCode.fromJson(data)).toList();
    }

    throw MyAPI.getError(url, response);
  }
}
