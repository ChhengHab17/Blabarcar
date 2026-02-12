import 'package:blablacar/models/ride/ride.dart';
import 'package:blablacar/ui/screens/rides/widgets/ride_tile.dart';
import 'package:blablacar/ui/screens/rides/widgets/ride_top_bar.dart';
import 'package:blablacar/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class RidesScreen extends StatelessWidget {
  const RidesScreen({super.key, required this.rides});
  final List<Ride> rides;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(BlaSpacings.l),
        child: Column(
          children: [
            TopBarTile(
              onClick: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 20),
            Expanded(
              child: rides.isEmpty
                  ? Center(child: Text("No Rides Found"))
                  : ListView.separated(
                      itemCount: rides.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10),
                      itemBuilder: (context, index) =>
                          RideTile(ride: rides[index]),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
