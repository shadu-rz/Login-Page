import 'package:flutter/material.dart';
import 'package:sample_project_1/main.dart';
import 'package:sample_project_1/screen_home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _nameofuser = TextEditingController();
  final TextEditingController _passwordofuser = TextEditingController();

  bool isdatamatched = true;
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: ListView(children: <Widget>[
              const SizedBox(
                height: 120,
              ),
              Container(
                alignment: Alignment.center,
                child: TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.person_outline,
                        color: Colors.purple,
                      ),
                      border: OutlineInputBorder(),
                      hintText: 'User Name',
                      hintStyle: TextStyle(fontStyle: FontStyle.italic)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'required';
                    } else {
                      return null;
                    }
                  },
                  controller: _nameofuser,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                child: TextFormField(
                  obscureText: true,
                  controller: _passwordofuser,
                  decoration: const InputDecoration(
                      fillColor: Colors.purple,
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Colors.purple,
                      ),
                      border: OutlineInputBorder(),
                      hintText: 'Password',
                      hintStyle: TextStyle(fontStyle: FontStyle.italic)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'required';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        checking(context);
                      } else {}
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        minimumSize: const Size(310, 50)),
                    child: const Text(
                      'login',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }

  void checking(BuildContext ctx) async {
    const username = 'shadu';
    const password = 'shadu';

    if (username == _nameofuser.text && password == _passwordofuser.text) {
      //go to home
      final sharedprefs = await SharedPreferences.getInstance();
      sharedprefs.setBool(sharedKeyValue, true);

      setState(() {
        isdatamatched = true;
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: ((context) {
          return const HomePage();
        })));
      });
    } else {
      const errormessage = 'username and passsword does not match';
      // snackbar
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red[700],
        content: const Text(errormessage),
      ));

      setState(() {
        isdatamatched = false;
      });
    }
  }
}
