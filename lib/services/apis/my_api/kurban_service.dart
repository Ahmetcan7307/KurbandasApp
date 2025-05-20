import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kurbandas/core/domain/entities/kurban.dart';

import '../../../core/domain/entities/address.dart';
import '../../../core/domain/entities/partner.dart';
import '../../../core/domain/entities/turkiye_api_district.dart';
import '../../../core/domain/entities/turkiye_api_province.dart';
import '../../../core/domain/entities/user.dart';

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
              "https://www.gidatarimziraat.com.tr/upload/news/beef3509716_1920.jpg",
            ],
            address: Address(
                province: TurkiyeAPIProvince(turkiyeAPIId: 1, name: "Adana"),
                district:
                    TurkiyeAPIDistrict(turkiyeAPIId: 1757, name: "Aladağ"),
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
                province: TurkiyeAPIProvince(turkiyeAPIId: 1, name: "Adana"),
                district:
                    TurkiyeAPIDistrict(turkiyeAPIId: 1219, name: "Ceyhan"),
                cutAddress: "Ceyhan"))
          ..documentId = "7"
          ..remainPartnersCount = 5
          ..status = KurbanStatus.waiting
      ]);

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

  Future<List<Kurban>> getKurbans(bool isActive, int page, int pageSize,
          Map<String, dynamic> filter) async =>
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

  Future<String> create(Map<String, dynamic> data) async =>
      await Future.value("test");

  Future update(Map<String, dynamic> data) async {}

  Future<Kurban> get(String documentId, bool isEdit) async =>
      (isEdit ? await getMyKurbans() : await getKurbans(true, 0, 0, {}))
          .firstWhere((kurban) => kurban.documentId == documentId)
        ..partners = isEdit
            ? List.empty()
            : List.generate(
                7,
                (partnerIndex) => Partner(
                    fullName: "User ${partnerIndex + 1}",
                    createdAt: DateTime.now()))
        ..isMy = isEdit
        ..cutDate = DateTime.now()
        ..owner = !isEdit ? User(name: "User", surname: "0") : null;
}
