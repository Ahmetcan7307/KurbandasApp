import 'package:dio/dio.dart';

import '../../../core/domain/entities/kurban_request.dart';
import '../../../core/domain/entities/user.dart';

class KurbanRequestService {
  final Dio dio;

  KurbanRequestService(this.dio);

  Future<List<KurbanRequest>> getRequests(String documentId) => Future.value([
        KurbanRequest(
            user: User(
                name: "Test",
                surname: "Testoğlu",
                email: "test@test.com",
                phoneNo: "905551234567"),
            createdAt: DateTime.now(),
            state: KurbanRequestState.waiting)
          ..documentId = "1",
        KurbanRequest(
            user: User(
                name: "Test1",
                surname: "Testoğlu",
                email: "test1@test.com",
                phoneNo: "905551234567"),
            createdAt: DateTime.now(),
            state: KurbanRequestState.waiting)
          ..documentId = "2",
        KurbanRequest(
            user: User(
                name: "Test2",
                surname: "Testoğlu",
                email: "test2@test.com",
                phoneNo: "905551234567"),
            createdAt: DateTime.now(),
            state: KurbanRequestState.approved)
          ..documentId = "3",
        KurbanRequest(
            user: User(
                name: "Test3",
                surname: "Testoğlu",
                email: "test3@test.com",
                phoneNo: "905551234567"),
            createdAt: DateTime.now(),
            state: KurbanRequestState.approved)
          ..documentId = "4"
      ]);

  Future<List<KurbanRequest>> approveOrDeclineRequest(
          String documentId, bool isApprove) async =>
      await getRequests(documentId);

  Future<bool> isRequestSend(String documentId) async =>
      await Future.value(false);

  Future sendRequest(String kurbanDocumentId) async {}
}
