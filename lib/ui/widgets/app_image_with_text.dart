import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppIconTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: Image.asset('images/GuestSpotLogo.png'),
            width: 100.0,
            height: 100.0,
          ),
          SizedBox(width: 5.0),
          Text(
            'Guest Spot',
            style: Theme.of(context).textTheme.headline2,
          )
        ],
      ),
    );
  }
}
