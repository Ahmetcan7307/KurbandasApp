import 'package:dio/dio.dart';
import 'package:kurbandas/services/apis/api/api.dart';
import 'package:kurbandas/services/apis/api/query.dart';

enum Controllers { province }

class TurkiyeAPI {
  static String getUrl(Controllers controllers, {List<Query>? queries}) {
    String url = "https://turkiyeapi.dev/api/v1/";

    switch (controllers) {
      case Controllers.province:
        url += "provinces";
        break;
    }

    if (queries != null) {
      if (queries.length == 1) {
        url += "?${queries[0].name}=${queries[0].value}";
      } else {
        url += "?";
        for (Query query in queries) {
          url += "${query.name}=${query.value}&";
        }
      }
    }

    return url;
  }

  static Exception getError(Response? response) => API.getError(response);

  static Exception getDioException(DioException e) => API.throwDioException(e);
}
