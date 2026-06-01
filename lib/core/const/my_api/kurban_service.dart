import 'package:flutter/widgets.dart';
import 'package:kurbandas/core/domain/entities/kurban.dart';
import 'package:kurbandas/core/domain/entities/partner.dart';
import 'package:kurbandas/core/domain/entities/user.dart';
import 'package:kurbandas/core/models/filter.dart';

class KurbanService {
  static List<KurbanAnimal> getAnimals() =>
      (WidgetsBinding.instance.platformDispatcher.locale.languageCode == "tr"
              ? [
                  {"documentId": "2", "name": "Koyun"},
                  {"documentId": "1", "name": "Keçi"},
                  {"documentId": "3", "name": "İnek"}
                ]
              : [
                  {"documentId": "ru5ea57tr3y6yu9ort3486yk", "name": "Cow"}
                ])
          .map((data) => KurbanAnimal.fromJson(data))
          .toList();

  static List<Kurban> getMyKurbans = ([
    {
      "documentId": "1",
      "weight": 100,
      "price": 1000,
      "status": "waiting",
      "cutDate": "2026-06-01T00:00:00",
      "totalPartnersCount": 7,
      "photoUrls": [
        "https://avatars.mds.yandex.net/i?id=2c619dc2d60ed35a7fae3d8c9c3cb55eb1ff76ee-5104871-images-thumbs&n=13"
      ],
      "remainPartnersCount": 7,
      "isMy": true,
      "animal": {"documentId": "1", "name": "Keçi"},
      "address": {
        "province": {"turkiyeAPIId": 1, "name": "Adana"},
        "district": {"turkiyeAPIId": 1757, "name": "Aladağ"},
        "cutAddress": "Aladağ Kesim Alanı"
      }
    },
    {
      "documentId": "2",
      "weight": 100,
      "price": 1000,
      "status": "waiting",
      "cutDate": "2026-06-01T00:00:00",
      "totalPartnersCount": 7,
      "photoUrls": [
        "https://avatars.mds.yandex.net/i?id=23c581216c0342b0ffd2e64b136e203b798fa247-7765754-images-thumbs&n=13"
      ],
      "remainPartnersCount": 7,
      "isMy": true,
      "animal": {"documentId": "2", "name": "Koyun"},
      "address": {
        "province": {"turkiyeAPIId": 34, "name": "İstanbul"},
        "district": {"turkiyeAPIId": 2051, "name": "Beylikdüzü"},
        "cutAddress": "Beylikdüzü Kesim Alanı"
      }
    },
    {
      "documentId": "3",
      "weight": 100,
      "price": 1000,
      "status": "waiting",
      "cutDate": "2026-06-01T00:00:00",
      "totalPartnersCount": 7,
      "photoUrls": [
        "https://avatars.mds.yandex.net/i?id=c5f9bdf5a710a6abfa4b452dba8378be1d6ab7d6-16322431-images-thumbs&n=13"
      ],
      "remainPartnersCount": 7,
      "isMy": true,
      "animal": {"documentId": "3", "name": "İnek"},
      "address": {
        "province": {"turkiyeAPIId": 7, "name": "Antalya"},
        "district": {"turkiyeAPIId": 2038, "name": "Konyaaltı"},
        "cutAddress": "Konyaaltı Kesim Alanı"
      }
    }
  ]).map((data) => Kurban.fromJson(data)).toList();

  static List<Kurban> getMyPartnerships = ([
    {
      "documentId": "i9bw0cxt9el13jq0l9pi3or1",
      "status": "waiting",
      "addressStr": "Adana / Aladağ Aladağ Kesim Alanı",
      "animal": {"name": "Keçi"},
      "owner": {"phoneNo": "905123456789"}
    },
    {
      "documentId": "1",
      "status": "waiting",
      "addressStr": "İstanbul / Beylikdüzü Beylikdüzü Kesim Alanı",
      "animal": {"name": "Koyun"},
      "owner": {"phoneNo": "905123456789"}
    },
    {
      "documentId": "2",
      "status": "waiting",
      "addressStr": "Antalya / konyaaltı Konyaaltı Kesim Alanı",
      "animal": {"name": "İnek"},
      "owner": {"phoneNo": "905123456789"}
    }
  ]).map((data) => Kurban.fromJson(data)).toList();

  static Iterable<Kurban> inactiveKurbans = ([
    {
      "documentId": "4",
      "weight": 100,
      "price": 1000,
      "status": "waiting",
      "totalPartnersCount": 7,
      "photoUrls": [
        "https://avatars.mds.yandex.net/i?id=7894bb911364e4281e7dd9276b375c2278b7dd9a-4824750-images-thumbs&n=13"
      ],
      "remainPartnersCount": 7,
      "address": {
        "province": {"turkiyeAPIId": 2, "name": "Adıyaman"},
        "district": {"turkiyeAPIId": 1182, "name": "Besni"},
        "cutAddress": "Besni Kesim Alanı"
      },
      "animal": {"documentId": "1", "name": "Keçi"}
    }
  ]).map((data) => Kurban.fromJson(data));

  static List<Kurban> getKurbans(bool isActive, Filter? filter) {
    Iterable<Kurban> kurbans;

    if (isActive) {
      kurbans = getMyKurbans.map((kurban) {
        kurban.isMy = null;
        return kurban;
      });
    } else {
      kurbans = inactiveKurbans;
    }

    if (filter != null) {
      if (filter.animal != null) {
        kurbans = kurbans.where(
            (kurban) => kurban.animal!.documentId == filter.animal!.documentId);
      }
      if (filter.selectedProvince != null) {
        kurbans = kurbans.where((kurban) =>
            kurban.address!.province!.turkiyeAPIId ==
            filter.selectedProvince!.turkiyeAPIId);
      }
      if (filter.selectedDistrict != null) {
        kurbans = kurbans.where((kurban) =>
            kurban.address!.district!.turkiyeAPIId ==
            filter.selectedDistrict!.turkiyeAPIId);
      }
    }

    return kurbans.toList();
  }

  static Kurban get(String documentId, bool isEdit, {User? user}) {
    Kurban kurban = getMyKurbans.firstWhere(
        (kurban) => kurban.documentId == documentId,
        orElse: () => inactiveKurbans.elementAt(0));

    if (isEdit) {
      kurban.isMy = null;
    } else {
      kurban.isMy = false;
      kurban.partners = ([
        {"fullName": "Hakkıcan Bülüç", "createdAt": "2026-06-01T10:18:46.898Z"},
        {"fullName": "birol bülüç", "createdAt": "2026-06-02T10:18:46.898Z"},
        {
          "fullName": "David Charleston",
          "createdAt": "2026-06-03T10:18:46.898Z"
        }
      ]).map((data) => Partner.fromJson(data)).toList();
      kurban.owner = user;
    }

    return kurban;
  }
}
