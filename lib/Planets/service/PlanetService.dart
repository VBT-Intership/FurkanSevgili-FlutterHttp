import 'dart:convert';
import 'dart:io';

import 'package:planets/Planets/model/ErrorModel.dart';
import 'package:planets/Planets/model/PlanetModel.dart';
import 'package:planets/Planets/service/IPlanetService.dart';
import 'package:http/http.dart' as http;

import '../model/PlanetModel.dart';

class PlanetService extends IPlanetService {
  final url = "http://192.168.1.106:3000";
  @override
  Future<List<PlanetModel>> getPlanetList() async {
    try {
      final response = await http.get(url);
      switch (response.statusCode) {
        case HttpStatus.ok:
          final jsonBody = jsonDecode(response.body);
          return jsonBody
              .map((e) => PlanetModel.fromJson(e))
              .cast<PlanetModel>()
              .toList();
          break;
        default:
          return null;
      }
    } catch (e) {
      throw ErrorModel("Not Found");
    }
  }
}
