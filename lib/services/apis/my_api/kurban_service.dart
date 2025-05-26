import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kurbandas/core/domain/entities/kurban.dart';

import '../api/query.dart';
import 'my_api.dart';

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

  Future<List<Kurban>> delete(String documentId) async {
    String url = MyAPI.getUrl(Controllers.kurbans, "Delete/$documentId");
    Response<List> response = await dio.delete(url);

    if (response.statusCode == 200) {
      return response.data!.map((data) => Kurban.fromJson(data)).toList();
    }

    throw MyAPI.getError(url, response);
  }

  Future<List<Kurban>> getMyPartnerships() async {
    String url = MyAPI.getUrl(Controllers.kurbans, "GetMyPartnerships");
    Response<List> response = await dio.get(url);

    if (response.statusCode == 200) {
      return response.data!.map((data) => Kurban.fromJson(data)).toList();
    }

    throw MyAPI.getError(url, response);
  }

  Future<List<Kurban>> getKurbans(bool isActive, int page, int pageSize,
      Map<String, dynamic> filter) async {
    String url = MyAPI.getUrl(Controllers.kurbans, "GetByFilter");
    Response<List> response = await dio.get(url, data: {
      "isActive": isActive,
      "filter": filter,
      "page": page,
      "pageSize": pageSize
    });

    if (response.statusCode == 200) {
      return response.data!.map((data) => Kurban.fromJson(data)).toList();
    }

    throw MyAPI.getError(url, response);
  }

  Future<String> create(Map<String, dynamic> data) async {
    String url = MyAPI.getUrl(Controllers.kurbans, "Create");
    Response<String> response = await dio.post(url, data: data);

    if (response.statusCode == 200) {
      return response.data!;
    }

    throw MyAPI.getError(url, response);
  }

  Future update(Map<String, dynamic> data) async {
    String url = MyAPI.getUrl(Controllers.kurbans, "Update");
    Response response = await dio.put(url, data: data);

    if (response.statusCode == 200) {
      return;
    }

    throw MyAPI.getError(url, response);
  }

  Future<Kurban> get(String documentId, bool isEdit) async {
    String url = MyAPI.getUrl(
        Controllers.kurbans, "GetDetail/$documentId?isEdit=$isEdit");
    Response<Map<String, dynamic>> response = await dio.get(url);

    if (response.statusCode == 200) {
      return Kurban.fromJson(response.data!);
    }

    throw MyAPI.getError(url, response);
  }
}
