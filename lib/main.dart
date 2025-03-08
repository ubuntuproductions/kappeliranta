import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kappeliranta/firebase_options.dart';
import 'package:nowa_runtime/nowa_runtime.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kappeliranta/user_info.dart';
import 'package:kappeliranta/globals/app_state.dart';
import 'package:kappeliranta/cards1.dart';
import 'package:kappeliranta/category_selection.dart';
import 'package:kappeliranta/home.dart';
import 'package:kappeliranta/login_firebase.dart';
import 'package:kappeliranta/register_firebase.dart';
import 'package:kappeliranta/reset_password_firebase.dart';
import 'package:kappeliranta/splash.dart';
import 'package:kappeliranta/splash_screen.dart';
import 'package:kappeliranta/user_information.dart';
import 'package:kappeliranta/wedding_page.dart';

@NowaGenerated()
late final SharedPreferences sharedPrefs;

@NowaGenerated()
main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPrefs = await SharedPreferences.getInstance();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

@NowaGenerated({'visibleInNowa': false})
class MyApp extends StatelessWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserInfo>(
      create: (context) => UserInfo(),
      child: ChangeNotifierProvider<AppState>(
        create: (context) => AppState(),
        builder: (context, child) => MaterialApp(
          theme: AppState.of(context).theme,
          routes: {
            'Cards1': (context) => const Cards1(),
            'CategorySelection': (context) => const CategorySelection(),
            'Home': (context) => const Home(),
            'LoginFirebase': (context) => const LoginFirebase(),
            'RegisterFirebase': (context) => const RegisterFirebase(),
            'ResetPasswordFirebase': (context) => const ResetPasswordFirebase(),
            'Splash': (context) => const Splash(),
            'SplashScreen': (context) => const SplashScreen(),
            'UserInformation': (context) => const UserInformation(),
            'WeddingPage': (context) => const WeddingPage(),
          },
          initialRoute: 'SplashScreen',
        ),
      ),
    );
  }
}
