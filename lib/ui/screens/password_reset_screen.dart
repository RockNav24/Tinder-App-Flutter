import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tinder_app_flutter/data/provider/user_provider.dart';
import 'package:tinder_app_flutter/util/constants.dart';
import 'package:tinder_app_flutter/util/utils.dart';

class PasswordResetScreen extends StatefulWidget {
  static String id = 'password_reset_screen';
  PasswordResetScreen({Key key}) : super(key: key);

  @override
  _PasswordResetScreenState createState() => _PasswordResetScreenState();
}

class _PasswordResetScreenState extends State<PasswordResetScreen> {
  UserProvider _userProvider;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController _inputEmail = TextEditingController();

  void initState() {
    super.initState();
    _userProvider = Provider.of(context, listen: false);
  }

  Future<bool> resetEmail(String email) async {
    return await _userProvider.resetUserPassword(email);
  }

  String _error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Password reset')),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Image.asset('images/GuestSpotLogo.png', height: 100, width: 100),
          const Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Text(
              'Guest Spot',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 65),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(fontSize: 16, fontFamily: 'Regular'),
              controller: _inputEmail,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(24, 18, 24, 18),
                hintText: 'Email',
                filled: true,
                fillColor: const Color(0XFFE8E8E8),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide:
                        const BorderSide(color: Color(0XFFE8E8E8), width: 0.0)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide:
                      const BorderSide(color: Color(0XFFE8E8E8), width: 0.0),
                ),
              ),
              validator: (value) => validateEmail(value),
            ),
          ),
          Text(
            _error,
            style: TextStyle(
              color: Colors.red,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton(
              onPressed: () async {
                bool result =
                    await _userProvider.resetUserPassword(_inputEmail.text);
                if (!result) {
                  _error = 'Email is not valid please check the email.';
                  setState(() {});
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: const Duration(milliseconds: 5000),
                    content: const Text('Plese check your email!'),
                  ),
                );
                Navigator.pop(context);
              },
              child: const Text('Reset Email'),
              style: ElevatedButton.styleFrom(
                primary: kAccentColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 20,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
