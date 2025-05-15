import 'package:dio/dio.dart';

import '../../../core/domain/entities/kurban_request.dart';
import 'my_api.dart';

class KurbanRequestService {
  final Dio dio;

  KurbanRequestService(this.dio);

  Future<List<KurbanRequest>> getRequests(String documentId) async {
    String url = MyAPI.getUrl(Controllers.kurbanRequests, "Get/$documentId");
    Response<List> response = await dio.get(url);

    if (response.statusCode == 200) {
      return response.data!
          .map((data) => KurbanRequest.fromJson(data))
          .toList();
    }

    throw MyAPI.getError(url, response);
  }

  Future<List<KurbanRequest>> approveOrDeclineRequest(
      String documentId, bool isApprove) async {
    String url = MyAPI.getUrl(Controllers.kurbanRequests, "ApproveOrDecline");
    Response<List> response = await dio
        .put(url, data: {"documentId": documentId, "isApprove": isApprove});

    if (response.statusCode == 200) {
      return response.data!
          .map((data) => KurbanRequest.fromJson(data))
          .toList();
    }

    throw MyAPI.getError(url, response);
  }

  Future<bool> isRequestSend(String documentId) async {
    String url =
        MyAPI.getUrl(Controllers.kurbanRequests, "IsRequestSend/$documentId");
    Response<bool> response = await dio.get(url);

    if (response.statusCode == 200) {
      return response.data!;
    }

    throw MyAPI.getError(url, response);
  }

  Future sendRequest(String kurbanDocumentId) async {
    String url =
        MyAPI.getUrl(Controllers.kurbanRequests, "Send/$kurbanDocumentId");
    Response response = await dio.post(url);

    if (response.statusCode == 200) {
      return;
    }

    throw MyAPI.getError(url, response);
  }
}
