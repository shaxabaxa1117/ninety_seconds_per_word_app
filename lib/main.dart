

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:ninenty_second_per_word_app/backend/database/firebase_streem.dart';
import 'package:ninenty_second_per_word_app/backend/provider/change_provider.dart';
import 'package:ninenty_second_per_word_app/database/note_data.dart';
import 'package:ninenty_second_per_word_app/pages/accaunt_page.dart';
import 'package:ninenty_second_per_word_app/pages/home_page.dart';
import 'package:ninenty_second_per_word_app/pages/login_page.dart';
import 'package:ninenty_second_per_word_app/pages/reset_password_page.dart';
import 'package:ninenty_second_per_word_app/pages/sign_up_page.dart';
import 'package:ninenty_second_per_word_app/pages/verify_mail_page.dart';
import 'package:provider/provider.dart';

// 
Future<void> main() async {
  


  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteDataAdapter());
  await Hive.openBox<NoteData>('notes');

  runApp(const MyApp());
}




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CounterProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            pageTransitionsTheme: const PageTransitionsTheme(builders: {
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            }),
          ),
          routes: {
            '/': (context) => const FirebaseStream(),
            '/home': (context) => const HomeScreen(),
            '/account': (context) => const AccountScreen(),
            '/login': (context) => const LoginScreen(),
            '/signup': (context) => const SignUpScreen(),
            '/reset_password': (context) => const ResetPasswordScreen(),
            '/verify_email': (context) => const VerifyEmailScreen(),
            '/account_page': (context) => const AccountScreen(),
          },
          initialRoute: '/',
        ));
  }
}
