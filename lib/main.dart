import 'package:flutter/material.dart';
import 'package:movie_app/auth/google_auth.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const GetMaterialApp(home: MovieApp()));
}

class MovieApp extends StatefulWidget {
  const MovieApp({super.key});

  @override
  State<MovieApp> createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                final user = await signInWithGoogle(context);
                print('user : $user');
                if (user == null) {
                  return;
                } else {
                  Get.snackbar('', '${user.email}');
                }
              },
              child: Text("Login via google"),
            ),
            ElevatedButton(
              onPressed: () async {
                await signOutWithGoogle();
              },
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
