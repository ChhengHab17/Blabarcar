import 'package:blablacar/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class BlaPassengerTile extends StatelessWidget {
  const BlaPassengerTile({super.key, required this.numberOfPassenger, required this.onTap});

  final int numberOfPassenger;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(Icons.person_outline, color: BlaColors.iconLight),
      title: Text(
        numberOfPassenger.toString(),
        style: BlaTextStyles.button.copyWith(color: BlaColors.neutral),
      ),
    );
  }
}
