import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kurbandas/services/apis/api/api.dart';
import 'package:kurbandas/services/apis/api/query.dart';

enum Controllers {
  users,
  appSettings,
  kurbanAnimals,
  kurbans,
  kurbanRequests,
  countryCodes
}

class MyAPI {
  static String getUrl(Controllers controllers, String action,
      {List<Query>? queries}) {
    String url = (dotenv.env["apiUrl"])!;

    switch (controllers) {
      case Controllers.users:
        url += "AppUsers";
        break;
      case Controllers.appSettings:
        url += "AppSettings";
        break;
      case Controllers.kurbanAnimals:
        url += "KurbanAnimals";
        break;
      case Controllers.kurbans:
        url += "Kurbans";
        break;
      case Controllers.kurbanRequests:
        url += "KurbanRequests";
        break;
      case Controllers.countryCodes:
        url += "CountryCodes";
        break;
    }

    url += "/$action";

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

  static Exception getError(String url, Response? response) =>
      API.getError(url, response);

  static Exception getDioException(DioException e) => API.getDioException(e);
}
