import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kurbandas/core/domain/entities/address.dart';
import 'package:kurbandas/core/domain/entities/kurban.dart';
import 'package:kurbandas/core/domain/entities/kurban_request.dart';
import 'package:kurbandas/core/domain/entities/turkiye_api_province.dart';
import 'package:kurbandas/core/domain/entities/user.dart';
import 'package:kurbandas/core/models/filter.dart';

import '../../../core/domain/entities/partner.dart';
import '../../../core/domain/entities/turkiye_api_district.dart';

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
            totalPartnersCount: 7,
            photoUrls: [
              "https://kpnhlnwftdzzhemluekd.supabase.co/storage/v1/object/public/kurbans/vqyyv08hsxf49vcymrioulcc/0.jpg",
              "https://kpnhlnwftdzzhemluekd.supabase.co/storage/v1/object/public/kurbans/vqyyv08hsxf49vcymrioulcc/1.webp",
              "https://kpnhlnwftdzzhemluekd.supabase.co/storage/v1/object/public/kurbans/vqyyv08hsxf49vcymrioulcc/2.jpg",
              "https://kpnhlnwftdzzhemluekd.supabase.co/storage/v1/object/public/kurbans/vqyyv08hsxf49vcymrioulcc/3.jpg",
              "https://kpnhlnwftdzzhemluekd.supabase.co/storage/v1/object/public/kurbans/vqyyv08hsxf49vcymrioulcc/4.jpg",
              "https://kpnhlnwftdzzhemluekd.supabase.co/storage/v1/object/public/kurbans/vqyyv08hsxf49vcymrioulcc/5.webp",
              "https://kpnhlnwftdzzhemluekd.supabase.co/storage/v1/object/public/kurbans/vqyyv08hsxf49vcymrioulcc/6.jpg"
            ],
            address: Address(
                province: TurkiyeAPIProvince(id: 1, name: "Adana"),
                district: TurkiyeAPIDistrict(id: 1757, name: "Aladağ"),
                cutAddress: "Aladağ"))
          ..documentId = "6"
          ..remainPartnersCount = 0
          ..status = KurbanStatus.waiting,
        Kurban(
            animal: KurbanAnimal(name: "Manda")..documentId = "2",
            weight: 600,
            price: 60000,
            totalPartnersCount: 7,
            photoUrls: [
              "https://isbh.tmgrup.com.tr/sbh/2020/06/13/650x344/sifa-kaynagi-urunlere-talep-cok-manda-az-1592033428910.jpg"
            ],
            address: Address(
                province: TurkiyeAPIProvince(id: 1, name: "Adana"),
                district: TurkiyeAPIDistrict(id: 1219, name: "Ceyhan"),
                cutAddress: "Ceyhan"))
          ..documentId = "7"
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

  // API, request'i atan kullanıcıya göre isMy propunu doldurmalı
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
