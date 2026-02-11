import 'package:blablacar/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class LocationSearchBar extends StatelessWidget {
  const LocationSearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.onClear
  });
  final TextEditingController controller;
  final Function(String) onChanged;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(BlaSpacings.l),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        autofocus: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(BlaSpacings.m, 0, 0, 0),
          filled: true,
          fillColor: BlaColors.disabled,
          prefixIcon: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios, size: BlaTextStyles.body.fontSize),
          ),
          prefixIconColor: BlaColors.neutral,
          suffixIcon: controller.text.isNotEmpty
              ? IconButton(icon: const Icon(Icons.close), onPressed: onClear)
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(BlaSpacings.radius),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
