import 'package:dio/dio.dart';

import '../../../core/domain/entities/kurban_request.dart';
import 'my_api.dart';

class KurbanRequestService {
  final Dio dio;

  KurbanRequestService(this.dio);

  Future<List<KurbanRequest>> getRequests(String documentId) async {
    Response<List> response = await dio
        .get(MyAPI.getUrl(Controllers.kurbanRequests, "Get/$documentId"));

    if (response.statusCode == 200) {
      return response.data!
          .map((data) => KurbanRequest.fromJson(data))
          .toList();
    }

    throw MyAPI.getError(response);
  }

  Future<List<KurbanRequest>> approveOrDeclineRequest(
      String encryptedData) async {
    Response<List> response = await dio.put(
      MyAPI.getUrl(Controllers.kurbanRequests, "ApproveOrDecline"),
      data: {"encryptedText": encryptedData},
    );

    if (response.statusCode == 200) {
      return response.data!
          .map((data) => KurbanRequest.fromJson(data))
          .toList();
    }

    throw MyAPI.getError(response);
  }

  Future<bool> isRequestSend(String documentId) async {
    Response<bool> response = await dio.get(
        MyAPI.getUrl(Controllers.kurbanRequests, "IsRequestSend/$documentId"));

    if (response.statusCode == 200) {
      return response.data!;
    }

    throw MyAPI.getError(response);
  }

  Future sendRequest(String kurbanDocumentId) async {
    Response response = await dio.post(
        MyAPI.getUrl(Controllers.kurbanRequests, "Send/$kurbanDocumentId"));

    if (response.statusCode == 200) {
      return;
    }

    throw MyAPI.getError(response);
  }
}
