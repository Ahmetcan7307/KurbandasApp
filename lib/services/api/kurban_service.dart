import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kurbandas/core/domain/entities/kurban.dart';
import 'package:kurbandas/core/domain/entities/kurban_request.dart';
import 'package:kurbandas/core/domain/entities/user.dart';

class KurbanService {
  final Dio dio;

  KurbanService({required this.dio});

  Future<List<KurbanAnimal>> getAnimals() =>
      WidgetsBinding.instance.platformDispatcher.locale.languageCode == "tr"
          ? Future.value([
              KurbanAnimal(name: "Sığır")..documentId = "1",
              KurbanAnimal(name: "Manda")..documentId = "2",
              KurbanAnimal(name: "Deve")..documentId = "3"
            ])
          : Future.value([
              KurbanAnimal(name: "Cattle")..documentId = "1",
              KurbanAnimal(name: "Buffalo")..documentId = "2",
              KurbanAnimal(name: "Camel")..documentId = "3"
            ]);

  Future<List<Kurban>> getMyKurbans() => Future.value([
        Kurban(
            animal: KurbanAnimal(name: "Sığır")..documentId = "1",
            weight: 450,
            price: 45000,
            address: "İstanbul / Beylikdüzü Beylikdüzü Kesim Alanı",
            totalPartnersCount: 7,
            photoUrls: [
              "https://media.barchart.com/contributors-admin/common-images/images/Livestock/Cattle%20%26%20Beef/Two%20cows%20on%20green%20pasture%20by%20Photo%20Mix%20via%20Pixabay.jpg"
            ])
          ..documentId = "1"
          ..remainPartnersCount = 0
          ..status = KurbanStatus.waiting,
        Kurban(
            animal: KurbanAnimal(name: "Manda")..documentId = "2",
            weight: 600,
            price: 60000,
            totalPartnersCount: 7,
            photoUrls: [
              "https://isbh.tmgrup.com.tr/sbh/2020/06/13/650x344/sifa-kaynagi-urunlere-talep-cok-manda-az-1592033428910.jpg"
            ])
          ..documentId = "1"
          ..remainPartnersCount = 5
          ..status = KurbanStatus.waiting
      ]);

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

  Future<List<Kurban>> delete(String documentId) async => await getMyKurbans();
}
