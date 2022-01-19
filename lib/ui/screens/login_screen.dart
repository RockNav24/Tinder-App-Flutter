import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tinder_app_flutter/data/db/remote/response.dart';
import 'package:tinder_app_flutter/data/provider/user_provider.dart';
import 'package:tinder_app_flutter/ui/screens/password_reset_screen.dart';
import 'package:tinder_app_flutter/ui/screens/top_navigation_screen.dart';
import 'package:tinder_app_flutter/util/constants.dart';
import 'package:tinder_app_flutter/util/utils.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController _inputEmail = TextEditingController();
  TextEditingController _inputPassword = TextEditingController();
  bool _isLoading = false;
  UserProvider _userProvider;

  @override
  void initState() {
    super.initState();
    _userProvider = Provider.of(context, listen: false);
  }

  void loginPressed() async {
    setState(() {
      _isLoading = true;
    });
    await _userProvider
        .loginUser(_inputEmail.text, _inputPassword.text, _scaffoldKey)
        .then((response) {
      if (response is Success<UserCredential>) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(TopNavigationScreen.id, (route) => false);
      }
    });
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 30),
                Image.asset('images/GuestSpotLogo.png',
                    height: 100, width: 100),
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
                          borderSide: const BorderSide(
                              color: Color(0XFFE8E8E8), width: 0.0)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: const BorderSide(
                            color: Color(0XFFE8E8E8), width: 0.0),
                      ),
                    ),
                    validator: (value) => validateEmail(value),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(fontSize: 16, fontFamily: 'Regular'),
                    controller: _inputPassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(24, 18, 24, 18),
                      hintText: 'Password',
                      filled: true,
                      fillColor: const Color(0XFFE8E8E8),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: const BorderSide(
                              color: Color(0XFFE8E8E8), width: 0.0)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: const BorderSide(
                            color: Color(0XFFE8E8E8), width: 0.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      loginPressed();
                    },
                    child: const Text('Sign In'),
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
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, PasswordResetScreen.id);
                  },
                  child: const Text('Forgot your password?'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
