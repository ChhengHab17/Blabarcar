import 'package:blablacar/ui/theme/theme.dart';
import 'package:blablacar/ui/widgets/actions/bla_button.dart';
import 'package:blablacar/ui/widgets/actions/bla_switch_button.dart';
import 'package:blablacar/ui/widgets/display/bla_divider.dart';
import 'package:blablacar/ui/widgets/inputs/bla_date_tile.dart';
import 'package:blablacar/ui/widgets/inputs/bla_location_tile.dart';
import 'package:blablacar/ui/widgets/inputs/bla_passenger_tile.dart';
import 'package:flutter/material.dart';

import '../../../../models/ride/locations.dart';
import '../../../../models/ride_pref/ride_pref.dart';

///
/// A Ride Preference From is a view to select:
///   - A depcarture location
///   - An arrival location
///   - A date
///   - A number of seats
///
/// The form can be created with an existing RidePref (optional).
///
class RidePrefForm extends StatefulWidget {
  // The form can be created with an optional initial RidePref.
  final RidePref? initRidePref;

  const RidePrefForm({super.key, this.initRidePref});

  @override
  State<RidePrefForm> createState() => _RidePrefFormState();
}

class _RidePrefFormState extends State<RidePrefForm> {
  Location? departure;
  late DateTime departureDate;
  Location? arrival; //initial for testing
  late int requestedSeats;

  // ----------------------------------
  // Initialize the Form attributes
  // ----------------------------------

  @override
  void initState() {
    super.initState();
    // TODO
    if (widget.initRidePref != null) {
      departure = widget.initRidePref!.departure;
      arrival = widget.initRidePref!.arrival;
      departureDate = widget.initRidePref!.departureDate;
      requestedSeats = widget.initRidePref!.requestedSeats;
    } else {
      departureDate = DateTime.now();
      requestedSeats = 1;
    }
  }

  // ----------------------------------
  // Handle events
  // ----------------------------------
  void onSwitch() {
    Location? temp = departure;
    setState(() {
      departure = arrival;
      arrival = temp;
    });
  }

  // ----------------------------------
  // Compute the widgets rendering
  // ----------------------------------

  // ----------------------------------
  // Build the widgets
  // ----------------------------------
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      padding: EdgeInsets.all(BlaSpacings.m),
      decoration: BoxDecoration(
        color: BlaColors.white,
        borderRadius: BorderRadius.circular(BlaSpacings.m),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          BlaLocationTile(
            location: departure,
            onTap: () {},
            type: TileType.departure,
            trailingIcon: BlaSwitchButton(onClick: onSwitch),
          ),
          BlaDivider(),
          BlaLocationTile(
            location: arrival,
            type: TileType.arrival,
            onTap: () {},
          ),
          BlaDivider(),
          BlaDateTile(date: departureDate, onTap: () {}),
          BlaDivider(),
          BlaPassengerTile(numberOfPassenger: requestedSeats, onTap: () {}),
          BlaDivider(),
          BlaButton(title: "Search", onClick: () {}),
        ],
      ),
    );
  }
}
