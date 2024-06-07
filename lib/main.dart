import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ninenty_second_per_word_app/backend/provider/change_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
            // '/': (context) => const FirebaseStream(),
            // '/home': (context) => const HomeScreen(),
            // '/account': (context) => const AccountScreen(),
            // '/login': (context) => const LoginScreen(),
            // '/signup': (context) => const SignUpScreen(),
            // '/reset_password': (context) => const ResetPasswordScreen(),
            // '/verify_email': (context) => const VerifyEmailScreen(),
            // '/object_security': (context) => ObjectSecurity(),
            // '/object_security_second_page': (context) =>
          },
          initialRoute: '/',
        ));
  }
}
