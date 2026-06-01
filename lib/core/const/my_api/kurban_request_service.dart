import 'package:kurbandas/core/domain/entities/kurban_request.dart';

class KurbanRequestService {
  static List<KurbanRequest> getRequests = ([
    {
      "documentId": "zdzgqu740tmqef8dog2n2ir2",
      "createdAt": "2026-06-01T08:45:42.643Z",
      "updatedAt": null,
      "state": "waiting",
      "user": {
        "email": "hakkicanbuluc@gmail.com",
        "name": "Hakkıcan",
        "surname": "Bülüç",
        "phoneNo": "905123456789"
      }
    },
    {
      "documentId": "1",
      "createdAt": "2026-06-01T08:45:42.643Z",
      "updatedAt": null,
      "state": "waiting",
      "user": {
        "email": "ahmetbalaman073@gmail.com",
        "name": "ahmet",
        "surname": "balaman",
        "phoneNo": "905123456789"
      }
    },
    {
      "documentId": "2",
      "createdAt": "2026-06-01T08:45:42.643Z",
      "updatedAt": null,
      "state": "waiting",
      "user": {
        "email": "ahmetcan7307test@gmail.com",
        "name": "Ahmetcan",
        "surname": "",
        "phoneNo": "905456789012"
      }
    }
  ]).map((data) => KurbanRequest.fromJson(data)).toList();
}
