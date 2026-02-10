import 'package:blablacar/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class BlaSwitchButton extends StatelessWidget {
  const BlaSwitchButton({super.key, required this.onClick});
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onClick,
      icon: Icon(Icons.swap_vert, color: BlaColors.primary),
    );
  }
}
