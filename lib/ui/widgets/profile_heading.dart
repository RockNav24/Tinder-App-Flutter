import 'package:flutter/material.dart';

class ProfileHeading extends StatelessWidget {
  const ProfileHeading({
    Key key,
    @required this.title,
    @required this.icon,
    this.iconIcon,
    this.iconText,
  }) : super(key: key);

  final String title;
  final IconData icon;

  final IconData iconIcon;
  final String iconText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon),
            Text(title),
          ],
        ),
        iconIcon != null && iconText != null
            ? TextButton.icon(
                onPressed: () {},
                icon: Icon(iconIcon),
                label: Text(iconText),
              )
            : const Text('City is visible on profile'),
      ],
    );
  }
}
