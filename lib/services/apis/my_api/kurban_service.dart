import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kurbandas/core/domain/entities/kurban.dart';
import 'package:kurbandas/core/domain/entities/kurban_request.dart';
import 'package:kurbandas/core/domain/entities/user.dart';
import 'package:kurbandas/core/models/filter.dart';
import 'package:kurbandas/services/apis/api/query.dart';
import 'package:kurbandas/services/apis/my_api/my_api.dart';

import '../../../core/domain/entities/partner.dart';

class KurbanService {
  final Dio dio;

  KurbanService({required this.dio});

  Future<List<KurbanAnimal>> getAnimals() async {
    String url = MyAPI.getUrl(Controllers.kurbanAnimals, "GetAll", queries: [
      Query(
          name: "locale",
          value: WidgetsBinding.instance.platformDispatcher.locale.languageCode)
    ]);
    Response<List> response = await dio.get(url);

    if (response.statusCode == 200) {
      return response.data!.map((data) => KurbanAnimal.fromJson(data)).toList();
    }

    throw MyAPI.getError(url, response);
  }

  Future<List<Kurban>> getMyKurbans() async {
    String url = MyAPI.getUrl(Controllers.kurbans, "GetMines");
    Response<List> response = await dio.get(url);

    if (response.statusCode == 200) {
      return response.data!.map((data) => Kurban.fromJson(data)).toList();
    }

    throw MyAPI.getError(url, response);
  }

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
          String documentId, bool isApprove) async =>
      await getRequests(documentId);

  Future<List<Kurban>> delete(String documentId) async => await getMyKurbans();

  Future<List<Kurban>> getMyPartnerships() async => await Future.value([
        Kurban(
            animal: KurbanAnimal(name: "Sığır"),
            addressStr: "İstanbul / Beylikdüzü Beylikdüzü Kesim Alanı",
            status: KurbanStatus.waiting,
            owner: User(phoneNo: "901234567890")),
        Kurban(
            animal: KurbanAnimal(name: "Manda"),
            addressStr: "İstanbul / Esenyurt Esenyurt Kesim Alanı",
            status: KurbanStatus.cut,
            owner: User(phoneNo: "901234567890")),
        Kurban(
            animal: KurbanAnimal(name: "Deve"),
            addressStr: "İstanbul / Fatih Fatih Kesim Alanı",
            status: KurbanStatus.shared,
            owner: User(phoneNo: "901234567890"))
      ]);

  Future<List<Kurban>> getKurbans(
          bool isActive, Filter? filter, int page, int pageSize) async =>
      await Future.value(List.generate(
          5,
          (index) => Kurban(
                  animal: KurbanAnimal(name: "Sheep"),
                  weight: 40 + (index % 300).toDouble(),
                  price: 1000 + (index * 100).toDouble(),
                  addressStr: "İstanbul / Beylikdüzü",
                  totalPartnersCount: 7,
                  status:
                      KurbanStatus.values[index % KurbanStatus.values.length],
                  photoUrls: [
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c4/Lleyn_sheep.jpg/800px-Lleyn_sheep.jpg",
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c4/Lleyn_sheep.jpg/800px-Lleyn_sheep.jpg",
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c4/Lleyn_sheep.jpg/800px-Lleyn_sheep.jpg",
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c4/Lleyn_sheep.jpg/800px-Lleyn_sheep.jpg"
                  ])
                ..documentId = index.toString()
                ..remainPartnersCount = index % 8));

  Future<bool> isRequestSend(String documentId) async =>
      await Future.value(false);

  Future postRequest(String documentId) async {}

  // returns DocumentId
  Future<String> post(Map<String, dynamic> data) async =>
      await Future.value("vqyyv08hsxf49vcymrioulcc");

  Future put(Map<String, dynamic> data) async {
    // API entegrasyon kodu eklenmeli
    // Şimdilik simulasyon olarak boş fonksiyon
    await Future.delayed(Duration(milliseconds: 500));
  }

  // API, request'i atan kullanıcıya göre isMy ve partners propları doldurmalı
  Future<Kurban> get(String documentId, bool isMy) async =>
      (isMy ? await getMyKurbans() : await getKurbans(true, null, 0, 0))
          .firstWhere((kurban) => kurban.documentId == documentId)
        ..partners = isMy
            ? List.empty()
            : List.generate(
                7,
                (partnerIndex) => Partner(
                    fullName: "User ${partnerIndex + 1}",
                    createdAt: DateTime.now()))
        ..isMy = isMy
        ..cutDate = DateTime.now()
        ..owner = isMy ? User(name: "User", surname: "0") : null;
}
