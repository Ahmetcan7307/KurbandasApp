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
              KurbanAnimal(name: "Koyun")..documentId = "1",
              KurbanAnimal(name: "Keçi")..documentId = "2",
              KurbanAnimal(name: "İnek")..documentId = "3"
            ])
          : Future.value([
              KurbanAnimal(name: "Cattle")..documentId = "1",
              KurbanAnimal(name: "Buffalo")..documentId = "2",
              KurbanAnimal(name: "Camel")..documentId = "3"
            ]);

  Future<List<Kurban>> getMyKurbans() => Future.value([
        Kurban(
            animal: KurbanAnimal(name: "Koyun")..documentId = "1",
            weight: 450,
            price: 45000,
            totalPartnersCount: 7,
            photoUrls: [
              "https://img.tv100.com/rcman/Cw1280h720q95gc/storage/files/images/2024/12/13/koyun-son-asdas-lazi_cover.jpg",
              "https://img.tv100.com/rcman/Cw1280h720q95gc/storage/files/images/2024/12/03/hayvan-kelle-asd-uwpg_cover.jpg"
                  "https://media.istockphoto.com/id/182344013/tr/foto%C4%9Fraf/sheep.jpg?s=612x612&w=0&k=20&c=VEx-bRSOsUAqnW45HWevJvSx0GGA3BUaPT1hOfT7j40="
            ],
            address: Address(
                province: TurkiyeAPIProvince(turkiyeAPIId: 7, name: "Antalya"),
                district:
                    TurkiyeAPIDistrict(turkiyeAPIId: 2039, name: "Muratpaşa"),
                cutAddress: "Muratpaşa Kesim Alanı"))
          ..documentId = "6"
          ..remainPartnersCount = 0
          ..status = KurbanStatus.waiting,
        Kurban(
            animal: KurbanAnimal(name: "İnek")..documentId = "3",
            weight: 600,
            price: 60000,
            totalPartnersCount: 7,
            photoUrls: [
              "https://www.reklamzamani.net/dosyalar/urun/650144_1.jpg",
              "https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg",
              "https://i.pinimg.com/originals/2d/23/32/2d23325e2f8ac623116e94251bff54d8.jpg"
            ],
            address: Address(
                province:
                    TurkiyeAPIProvince(turkiyeAPIId: 34, name: "İstanbul"),
                district:
                    TurkiyeAPIDistrict(turkiyeAPIId: 2051, name: "Beylikdüzü"),
                cutAddress: "Beylikdüzü Kesim Alanı"))
          ..documentId = "7"
          ..remainPartnersCount = 5
          ..status = KurbanStatus.waiting
      ]);

  Future<List<Kurban>> delete(String documentId) async => await getMyKurbans();

  Future<List<Kurban>> getMyPartnerships() async => await Future.value([
        Kurban(
            animal: KurbanAnimal(name: "Keçi"),
            addressStr: "İstanbul / Beylikdüzü Beylikdüzü Kesim Alanı",
            status: KurbanStatus.waiting,
            owner: User(phoneNo: "901234567890")),
        Kurban(
            animal: KurbanAnimal(name: "İnek"),
            addressStr: "İstanbul / Esenyurt Esenyurt Kesim Alanı",
            status: KurbanStatus.cut,
            owner: User(phoneNo: "901234567890")),
        Kurban(
            animal: KurbanAnimal(name: "Koyun"),
            addressStr: "İstanbul / Fatih Fatih Kesim Alanı",
            status: KurbanStatus.shared,
            owner: User(phoneNo: "901234567890"))
      ]);

  Future<List<Kurban>> getKurbans(bool isActive, int page, int pageSize,
          Map<String, dynamic> filter) async =>
      await Future.value(List.generate(5, (index) {
        List<Map<String, dynamic>> animals = [
          {
            "animal": KurbanAnimal(name: "Koyun"),
            "photos": [
              "https://img.tv100.com/rcman/Cw1280h720q95gc/storage/files/images/2024/12/13/koyun-son-asdas-lazi_cover.jpg",
              "https://img.tv100.com/rcman/Cw1280h720q95gc/storage/files/images/2024/12/03/hayvan-kelle-asd-uwpg_cover.jpg",
              "https://media.istockphoto.com/id/182344013/tr/foto%C4%9Fraf/sheep.jpg?s=612x612&w=0&k=20&c=VEx-bRSOsUAqnW45HWevJvSx0GGA3BUaPT1hOfT7j40="
            ]
          },
          {
            "animal": KurbanAnimal(name: "İnek"),
            "photos": [
              "https://www.reklamzamani.net/dosyalar/urun/650144_1.jpg",
              "https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg",
              "https://i.pinimg.com/originals/2d/23/32/2d23325e2f8ac623116e94251bff54d8.jpg"
            ]
          },
          {
            "animal": KurbanAnimal(name: "Keçi"),
            "photos": [
              "https://www.esk.gov.tr/upload/Node/11001/pics/keci_1.jpg",
              "https://www.esk.gov.tr/upload/Node/11132/pics/Boer-Goat.jpg",
              "https://image.milimaj.com/i/milliyet/75/0x0/6164b4d886b24425d04acc4c.jpg"
            ]
          }
        ];
        return Kurban(
            animal: animals[index % 3]["animal"],
            weight: 40 + (index % 300).toDouble(),
            price: 1000 + (index * 100).toDouble(),
            addressStr: "İstanbul / Beylikdüzü Beylikdüzü Kesim Alanı",
            totalPartnersCount: 7,
            status: KurbanStatus.values[index % KurbanStatus.values.length],
            photoUrls: animals[index % 3]["photos"])
          ..documentId = index.toString()
          ..remainPartnersCount = index % 8;
      }));

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
