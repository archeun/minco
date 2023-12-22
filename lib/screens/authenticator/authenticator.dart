import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Authenticator extends StatelessWidget {
  const Authenticator({super.key});

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.all(12),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
        ),
      ),
      initialRoute:
          FirebaseAuth.instance.currentUser == null ? '/sign-in' : '/profile',
      routes: {
        '/sign-in': (context) {
          return SignInScreen(
            providers: [
              EmailAuthProvider(),
              GoogleProvider(
                clientId: dotenv.get('GOOGLE_SSO_CLIENT_ID'),
              ),
            ],
            headerBuilder: (context, constraints, shrinkOffset) {
              return Padding(
                padding: const EdgeInsets.all(
                  20,
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset(
                    'assets/images/logo.png',
                  ),
                ),
              );
            },
            footerBuilder: (context, action) {
              return const Padding(
                padding: EdgeInsets.only(
                  top: 16,
                ),
                child: Text(
                  'By signing in, you agree to Minco\'s terms and conditions.',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            },
            sideBuilder: (context, shrinkOffset) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset(
                    'assets/images/logo.png',
                  ),
                ),
              );
            },
            actions: [
              AuthStateChangeAction<SignedIn>((context, state) {
                Navigator.pushReplacementNamed(
                  context,
                  '/profile',
                );
              }),
            ],
          );
        },
        '/profile': (context) {
          return ProfileScreen(
            providers: [
              EmailAuthProvider(),
              GoogleProvider(
                clientId: dotenv.get('GOOGLE_SSO_CLIENT_ID'),
              ),
            ],
            actions: [
              SignedOutAction((context) {
                Navigator.pushReplacementNamed(
                  context,
                  '/sign-in',
                );
              }),
            ],
          );
        },
      },
    );
  }
}
