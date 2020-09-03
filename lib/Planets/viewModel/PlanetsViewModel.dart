import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:planets/Planets/model/PlanetModel.dart';
import 'package:planets/Planets/view/Planets.dart';
import 'package:http/http.dart' as http;

abstract class PlanetsViewModel extends State<Planets> {
  bool isLoading = false;
  final url = "http://192.168.1.101:3000";
  List<PlanetModel> planets = [];
  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    callItems();
  }

  Future<void> callItems() async {
    changeLoading();
    await _getPlanets();
    changeLoading();
  }

  Future<void> _getPlanets() async {
    final response = await http.get(url);
    switch (response.statusCode) {
      case HttpStatus.ok:
        final jsonBody = jsonDecode(response.body);
        if (jsonBody is List) {
          planets = jsonBody.map((e) => PlanetModel.fromJson(e)).toList();
        }
        break;
      default:
    }
  }
}
