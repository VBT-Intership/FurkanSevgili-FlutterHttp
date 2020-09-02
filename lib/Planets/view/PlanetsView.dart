import 'package:flutter/material.dart';
import 'package:planets/Planets/viewModel/PlanetsViewModel.dart';

class PlanetsView extends PlanetsViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar,
      body: buildListView(),
    );
  }

  ListView buildListView() {
    return ListView.builder(
      itemCount: planets.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            leading: Image.network(planets[index].picture),
            title: Text(planets[index].name),
            subtitle: Text(planets[index].distanceFromSun),
            trailing: Text(planets[index].orbitalPeriod),
            onTap: null,
          ),
        );
      },
    );
  }

  AppBar get buildAppBar {
    return AppBar(leading: buildPaddingProgress, title: buildTextAppBar());
  }

  Visibility get buildPaddingProgress {
    return Visibility(
      visible: isLoading,
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.035),
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ),
    );
  }

  Text buildTextAppBar() => Text("Planets");
}
