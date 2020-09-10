import 'package:flutter/material.dart';
import 'package:planets/Planets/model/ErrorModel.dart';
import 'package:planets/Planets/model/PlanetModel.dart';
import 'package:planets/Planets/viewModel/PlanetsViewModel.dart';

import '../model/PlanetModel.dart';

class PlanetsView extends PlanetsViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: FutureBuilder<List<PlanetModel>>(
        future: planetService.getPlanetList(),
        builder:
            (BuildContext context, AsyncSnapshot<List<PlanetModel>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasData) {
                return buildListViewPlanets(snapshot.data);
              } else {
                final error = snapshot.error as ErrorModel;
                return Center(
                  child: Text(error.text),
                );
              }
              break;
            default:
              return Text("Something went wrong");
          }
        },
      ),
    ); //buildListViewPlanets()
  }

  ListView buildListViewPlanets(List<PlanetModel> plnets) {
    return ListView.builder(
      itemCount: plnets.length,
      itemBuilder: (BuildContext context, int index) {
        return buildCardPlanets(plnets[index]);
      },
    );
  }

  Card buildCardPlanets(PlanetModel planet) {
    return Card(
      child: ListTile(
        leading: Image.network(planet.picture),
        title: Text(planet.name),
        subtitle: Text(planet.distanceFromSun),
        trailing: Text(planet.orbitalPeriod),
        onTap: null,
      ),
    );
  }

  AppBar buildAppBar(context) {
    return AppBar(centerTitle: true, title: buildTextAppBar());
  }

  Text buildTextAppBar() => Text(
        "Planets",
        textAlign: TextAlign.center,
      );
}
