import 'package:flutter/material.dart';
import 'package:sample_project_1/main.dart';
import 'package:sample_project_1/screen_home_page.dart';
import 'package:sample_project_1/screen_login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    userLogged();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.yellow,
      body: SafeArea(
        child: Center(
          child: Text(
            'HELLO',
            style: TextStyle(
                fontSize: 40,
                color: Colors.purple,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Future<void> gotoLogin() async {
    await Future.delayed(const Duration(seconds: 3));
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: ((ctx) {
      return const LoginPage();
    })));
  }

  Future<void> userLogged() async {
    final sharedprefs = await SharedPreferences.getInstance();
    final userloggedin = sharedprefs.getBool(sharedKeyValue);
    if (userloggedin == null || userloggedin == false) {
      gotoLogin();
    } else {
      // ignore: use_build_context_synchronously
      Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
        return const HomePage();
      })));
    }
  }
}
