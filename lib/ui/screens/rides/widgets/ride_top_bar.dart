import 'package:blablacar/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class TopBarTile extends StatelessWidget {
  const TopBarTile({super.key, required this.onClick});
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(BlaSpacings.m)
      ),
      tileColor: BlaColors.backgroundAccent,
      leading: IconButton(onPressed: onClick, icon: Icon(Icons.arrow_back_ios, color: BlaColors.iconLight,)),
    );
  }
}
