import 'package:blablacar/models/ride/locations.dart';
import 'package:blablacar/ui/theme/theme.dart';
import 'package:flutter/material.dart';

enum TileType { departure, arrival }

class BlaLocationTile extends StatelessWidget {
  const BlaLocationTile({
    super.key,
    required this.location,
    required this.onTap,
    required this.type,
    this.trailingIcon,
  });

  final Location? location;
  final VoidCallback onTap;
  final Widget? trailingIcon;
  final TileType type;

  String get title =>
      "${location?.name}${type == TileType.arrival ? ", ${location?.country.name}" : ""} ";
  String get placeHolder => type == TileType.departure ? "Leaving from" : "Going to";

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(Icons.radio_button_unchecked, color: BlaColors.iconLight),
      title: Text(
        location == null ? placeHolder : title,
        style: BlaTextStyles.button.copyWith(color: BlaColors.neutral),
      ),
      trailing: location == null ? null : trailingIcon,
    );
  }
}
