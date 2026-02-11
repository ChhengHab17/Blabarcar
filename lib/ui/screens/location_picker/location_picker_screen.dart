import 'package:blablacar/models/ride/locations.dart';
import 'package:blablacar/services/location_service.dart';
import 'package:blablacar/ui/screens/location_picker/widgets/location_result_tile.dart';
import 'package:blablacar/ui/screens/location_picker/widgets/location_search_bar.dart';
import 'package:blablacar/ui/theme/theme.dart';
import 'package:blablacar/ui/widgets/display/bla_divider.dart';
import 'package:flutter/material.dart';

class LocationPickerScreen extends StatefulWidget {
  const LocationPickerScreen({super.key});

  @override
  State<LocationPickerScreen> createState() => _LocationPickerScreenState();
}

class _LocationPickerScreenState extends State<LocationPickerScreen> {
  final TextEditingController controller = TextEditingController();
  List<Location> filteredLocations = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onSearch(String value) {
    setState(() {
      filteredLocations = LocationsService.search(value);
    });
  }

  void onClear() {
    controller.clear();
    setState(() {
      filteredLocations = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          LocationSearchBar(
            controller: controller,
            onChanged: onSearch,
            onClear: onClear,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(BlaSpacings.l),
              child: filteredLocations.isEmpty && controller.text.isEmpty
                  ? const Center(child: Text("Start typing to search"))
                  : filteredLocations.isEmpty
                  ? Center(child: Text('No Location Found'))
                  : ListView.separated(
                      itemCount: filteredLocations.length,
                      separatorBuilder: (_, __) => const BlaDivider(),
                      itemBuilder: (context, index) {
                        final location = filteredLocations[index];

                        return LocationResultTile(
                          location: location,
                          onTap: () {
                            Navigator.pop(context, location);
                          },
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
