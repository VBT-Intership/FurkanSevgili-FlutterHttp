class PlanetModel {
  String name;
  String distanceFromSun;
  String orbitalPeriod;
  String picture;
  List<Moons> moons;

  PlanetModel(
      {this.name,
      this.distanceFromSun,
      this.orbitalPeriod,
      this.picture,
      this.moons});

  PlanetModel.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    distanceFromSun = json['distanceFromSun'];
    orbitalPeriod = json['orbitalPeriod'];
    picture = json['picture'];
    if (json['moons'] != null) {
      moons = new List<Moons>();
      json['moons'].forEach((v) {
        moons.add(new Moons.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['distanceFromSun'] = this.distanceFromSun;
    data['orbitalPeriod'] = this.orbitalPeriod;
    data['picture'] = this.picture;
    if (this.moons != null) {
      data['moons'] = this.moons.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Moons {
  String name;
  String picture;

  Moons({this.name, this.picture});

  Moons.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    picture = json['picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['picture'] = this.picture;
    return data;
  }
}
