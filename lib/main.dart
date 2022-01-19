import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tinder_app_flutter/data/provider/user_provider.dart';
import 'package:tinder_app_flutter/ui/screens/chat_screen.dart';
import 'package:tinder_app_flutter/ui/screens/complete_profile.dart';
import 'package:tinder_app_flutter/ui/screens/login_screen.dart';
import 'package:tinder_app_flutter/ui/screens/matched_screen.dart';
import 'package:tinder_app_flutter/ui/screens/password_reset_screen.dart';
import 'package:tinder_app_flutter/ui/screens/register_screen.dart';
import 'package:tinder_app_flutter/ui/screens/splash_screen.dart';
import 'package:tinder_app_flutter/ui/screens/start_screen.dart';
import 'package:tinder_app_flutter/ui/screens/top_navigation_screen.dart';
import 'package:tinder_app_flutter/util/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(systemNavigationBarColor: Colors.black));
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: kFontFamily,
          indicatorColor: kAccentColor,
          scaffoldBackgroundColor: kPrimaryColor,
          hintColor: kSecondaryColor,
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline2: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
            headline3: TextStyle(fontSize: 38.0, fontWeight: FontWeight.bold),
            headline4: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            bodyText1: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            bodyText2: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            button: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ).apply(
            bodyColor: kSecondaryColor,
            displayColor: kSecondaryColor,
          ),
          buttonTheme: kButtonTheme,
          colorScheme: ColorScheme.fromSwatch(
                  primarySwatch:
                      MaterialColor(kBackgroundColorInt, kThemeMaterialColor))
              .copyWith(secondary: kSecondaryColor),
        ),
        initialRoute: SplashScreen.id,
        routes: {
          CompleteProfileScreen.id: (context) => CompleteProfileScreen(),
          SplashScreen.id: (context) => SplashScreen(),
          StartScreen.id: (context) => StartScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          PasswordResetScreen.id: (context) => PasswordResetScreen(),
          RegisterScreen.id: (context) => RegisterScreen(),
          TopNavigationScreen.id: (context) => TopNavigationScreen(),
          MatchedScreen.id: (context) => MatchedScreen(
                myProfilePhotoPath: (ModalRoute.of(context).settings.arguments
                    as Map)['my_profile_photo_path'],
                myUserId: (ModalRoute.of(context).settings.arguments
                    as Map)['my_user_id'],
                otherUserProfilePhotoPath: (ModalRoute.of(context)
                    .settings
                    .arguments as Map)['other_user_profile_photo_path'],
                otherUserId: (ModalRoute.of(context).settings.arguments
                    as Map)['other_user_id'],
              ),
          ChatScreen.id: (context) => ChatScreen(
                chatId: (ModalRoute.of(context).settings.arguments
                    as Map)['chat_id'],
                otherUserId: (ModalRoute.of(context).settings.arguments
                    as Map)['other_user_id'],
                myUserId: (ModalRoute.of(context).settings.arguments
                    as Map)['user_id'],
              ),
        },
      ),
    );
  }
}
