import 'package:blablacar/ui/theme/theme.dart';
import 'package:flutter/material.dart';

enum ButtonType { primary, secondary }

class BlaButton extends StatelessWidget {
  const BlaButton({
    super.key,
    required this.title,
    required this.onClick,
    this.icon,
    this.buttonType = ButtonType.primary,
  });
  final String title;
  final IconData? icon;
  final VoidCallback onClick;
  final ButtonType buttonType;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      style: ElevatedButton.styleFrom(
        iconColor: buttonType == ButtonType.primary
            ? BlaColors.white
            : BlaColors.primary,
        foregroundColor: buttonType == ButtonType.primary
            ? BlaColors.white
            : BlaColors.primary,
        backgroundColor: buttonType == ButtonType.primary
            ? BlaColors.primary
            : BlaColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(BlaSpacings.radius),
          side: buttonType == ButtonType.secondary
              ? BorderSide(color: BlaColors.greyLight)
              : BorderSide.none,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(BlaSpacings.s),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon),
              const SizedBox(width: BlaSpacings.s),
            ],
            Text(title, style: BlaTextStyles.button),
          ],
        ),
      ),
    );
  }
}
