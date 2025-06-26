import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kurbandas/core/domain/entities/kurban.dart';

import '../api/query.dart';
import 'my_api.dart';

class KurbanService {
  final Dio dio;

  KurbanService({required this.dio});

  Future<List<KurbanAnimal>> getAnimals() async {
    Response<List> response = await dio
        .get(MyAPI.getUrl(Controllers.kurbanAnimals, "GetAll", queries: [
      Query(
          name: "locale",
          value: WidgetsBinding.instance.platformDispatcher.locale.languageCode)
    ]));

    if (response.statusCode == 200) {
      return response.data!.map((data) => KurbanAnimal.fromJson(data)).toList();
    }

    throw MyAPI.getError(response);
  }

  Future<List<Kurban>> getMyKurbans() async {
    Response<List> response =
        await dio.get(MyAPI.getUrl(Controllers.kurbans, "GetMines"));

    if (response.statusCode == 200) {
      return response.data!.map((data) => Kurban.fromJson(data)).toList();
    }

    throw MyAPI.getError(response);
  }

  Future<List<Kurban>> delete(String documentId) async {
    Response<List> response = await dio
        .delete(MyAPI.getUrl(Controllers.kurbans, "Delete/$documentId"));

    if (response.statusCode == 200) {
      return response.data!.map((data) => Kurban.fromJson(data)).toList();
    }

    throw MyAPI.getError(response);
  }

  Future<List<Kurban>> getMyPartnerships() async {
    Response<List> response =
        await dio.get(MyAPI.getUrl(Controllers.kurbans, "GetMyPartnerships"));

    if (response.statusCode == 200) {
      return response.data!.map((data) => Kurban.fromJson(data)).toList();
    }

    throw MyAPI.getError(response);
  }

  Future<List<Kurban>> getKurbans(bool isActive, int page, int pageSize,
      Map<String, dynamic> filter) async {
    Response<List> response = await dio
        .get(MyAPI.getUrl(Controllers.kurbans, "GetByFilter"), data: {
      "isActive": isActive,
      "filter": filter,
      "page": page,
      "pageSize": pageSize
    });

    if (response.statusCode == 200) {
      return response.data!.map((data) => Kurban.fromJson(data)).toList();
    }

    throw MyAPI.getError(response);
  }

  Future<String> create(Map<String, dynamic> data) async {
    Response<String> response =
        await dio.post(MyAPI.getUrl(Controllers.kurbans, "Create"), data: data);

    if (response.statusCode == 200) {
      return response.data!;
    }

    throw MyAPI.getError(response);
  }

  Future update(Map<String, dynamic> data) async {
    Response response =
        await dio.put(MyAPI.getUrl(Controllers.kurbans, "Update"), data: data);

    if (response.statusCode == 200) {
      return;
    }

    throw MyAPI.getError(response);
  }

  Future<Kurban> get(String documentId, bool isEdit) async {
    Response<Map<String, dynamic>> response = await dio.get(MyAPI.getUrl(
        Controllers.kurbans, "GetDetail/$documentId?isEdit=$isEdit"));

    if (response.statusCode == 200) {
      return Kurban.fromJson(response.data!);
    }

    throw MyAPI.getError(response);
  }
}
