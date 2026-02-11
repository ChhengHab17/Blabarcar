import 'package:blablacar/models/ride/locations.dart';
import 'package:blablacar/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class LocationResultTile extends StatelessWidget {
  const LocationResultTile({
    super.key,
    required this.location,
    required this.onTap,
  });
  final Location location;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        location.name,
        style: BlaTextStyles.body.copyWith(color: BlaColors.neutral),
      ),
      subtitle: Text(
        location.country.name,
        style: BlaTextStyles.label.copyWith(color: BlaColors.disabled),
      ),
      trailing: Icon(Icons.chevron_right, color: BlaColors.disabled,),
    );
  }
}
