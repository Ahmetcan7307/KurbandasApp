import 'package:dio/dio.dart';
import 'package:kurbandas/core/domain/entities/country_code.dart';

import 'my_api.dart';

class CountryService {
  final Dio dio;

  CountryService(this.dio);

  Future<List<CountryCode>> getAll() async {
    Response<List> response =
        await dio.get(MyAPI.getUrl(Controllers.countryCodes, "GetAll"));

    if (response.statusCode == 200) {
      return response.data!.map((data) => CountryCode.fromJson(data)).toList();
    }

    throw MyAPI.getError(response);
  }
}
