import 'package:blablacar/data/dummy_data.dart';

import '../models/ride/locations.dart';

////
///   This service handles:
///   - The list of available rides
///
class LocationsService {
  static const List<Location> availableLocations =
      fakeLocations; // TODO for now fake data
  static List<Location> search(String value) {
    if (value.length <= 1) return [];

    return availableLocations
        .where((l) => l.name.toLowerCase().contains(value.toLowerCase()))
        .toList();
  }
}
