class MoonModel {
  String name;
  String picture;

  MoonModel({this.name, this.picture});

  MoonModel.fromJson(Map<String, dynamic> json) {
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
