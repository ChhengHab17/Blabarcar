import 'package:blablacar/models/ride/ride.dart';
import 'package:blablacar/ui/theme/theme.dart';
import 'package:blablacar/utils/date_time_utils.dart';
import 'package:flutter/material.dart';

class RideTile extends StatelessWidget {
  const RideTile({super.key, required this.ride});
  final Ride ride;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(BlaSpacings.m)
        ),
        tileColor: BlaColors.greyLight,
        title: Column(
          children: [
            Text('Departure: ${ride.departureLocation.name}'),
            Text('Arrival: ${ride.arrivalLocation.name}'),
            Text('Time: ${DateTimeUtils.formatTime(ride.departureDate)}'),
            Text('Seats: ${ride.availableSeats.toString()}'),
          ],
        ),
      ),
    );
  }
}
