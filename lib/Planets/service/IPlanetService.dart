import '../model/PlanetModel.dart';

abstract class IPlanetService {
  Future<List<PlanetModel>> getPlanetList();
}
