// ignore_for_file: unnecessary_string_escapes

import 'package:flutter/material.dart';
import 'package:sample_project_1/screen_login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text('Home'),
            ],
          ),
          actions: [
            IconButton(
                onPressed: (() {
                  showDialog(
                      context: context,
                      builder: ((context) {
                        return AlertDialog(
                          title: const Text(
                            'Alert! ',
                            style: TextStyle(color: Colors.red),
                          ),
                          content:
                              const Text('Are you sure you want to Logout?'),
                          actions: [
                            TextButton(
                                onPressed: (() {
                                  popoutfuction(context);
                                }),
                                child: const Text('No',
                                    style: TextStyle(color: Colors.black))),
                            TextButton(
                                onPressed: (() {
                                  signout(context);
                                }),
                                child: const Text(
                                  'Yes',
                                  style: TextStyle(color: Colors.black),
                                )),
                          ],
                        );
                      }));
                }),
                icon: const Icon(Icons.exit_to_app_rounded))
          ],
        ),
        body: SafeArea(
            child: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Person $index'),
              subtitle: Text('Message $index'),
              leading: (index % 2 == 0)
                  ? ConstrainedBox(
                      constraints: const BoxConstraints(
                        minHeight: 44,
                        minWidth: 44,
                        maxHeight: 64,
                        maxWidth: 64,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('assets/images/robo.jpg'),
                      ),
                    )
                  : const CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/images/cube.jpg'),
                    ),
              trailing: Text('$index:00 PM'),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: 21,
        )));
  }

  popoutfuction(BuildContext context) {
    return Navigator.of(context).pop();
  }

  signout(BuildContext ctx) async {
    final sharedprefs = await SharedPreferences.getInstance();
    await sharedprefs.clear();
    // ignore: use_build_context_synchronously
    return Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: ((context) {
      return const LoginPage();
    })), (route) => false);
  }
}
