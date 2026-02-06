import 'package:blablacar/models/ride/locations.dart';

import '../data/dummy_data.dart';
import '../models/ride/ride.dart';

////
///   This service handles:
///   - The list of available rides
///
class RidesService {
  static List<Ride> allRides = fakeRides;

  static List<Ride> filterByDeparture(Location departure) {
    List<Ride> filteredRide = [];
    allRides.map((r) {
      if (r.departureLocation == departure) {
        filteredRide.add(r);
      }
    });
    return filteredRide;
  }

  static List<Ride> filterByRequestSeats(int seatRequest) {
    List<Ride> filteredRide = [];
    allRides.map((r) {
      if (r.remainingSeats >= seatRequest) {
        filteredRide.add(r);
      }
    });
    return filteredRide;
  }

  static List<Ride> filterBy({Location? departure, int? seatRequested}) {
    if (departure == null || seatRequested == null) {
      return [];
    }
    List<Ride> filteredRide = [];
    allRides.map((r) {
      if (r.departureLocation == departure ||
          r.remainingSeats >= seatRequested) {
        filteredRide.add(r);
      }
    });

    return filteredRide;
  }
}
