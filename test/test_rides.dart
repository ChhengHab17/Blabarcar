import 'package:blablacar/models/ride/ride.dart';

import 'package:blablacar/models/ride/locations.dart';
import 'package:blablacar/services/rides_service.dart';

void main() {
  Location london = Location(name: "London", country: Country.uk);

  List<Ride> filteredRide = RidesService.filterBy(
    seatRequested: 1,
    departure: london,
  );

  for (Ride ride in filteredRide) {
    print(ride);
  }
}
