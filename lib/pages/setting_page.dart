import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/pages/login.dart';
import 'package:flutter_application_1/pages/profile_page.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Settingpage extends StatefulWidget {
  const Settingpage({super.key});

  @override
  State<Settingpage> createState() => _SettingpageState();
}

class _SettingpageState extends State<Settingpage> {
  final storage = const FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
        backgroundColor: Colors.blue[200],
      ),
      backgroundColor: Colors.grey.shade200,
      body: Container(
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
          child: Column(
            children: <Widget>[
              buildItem(
                icon: Icons.person,
                title: 'Profile',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(),
                    ),
                  );
                },
              ),
              buildItem(
                icon: Icons.language,
                title: 'language',
                onTap: () {},
              ),
              buildItem(
                icon: Icons.settings,
                title: 'Settings',
                onTap: () {},
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton.icon(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => SimpleDialog(
                        title: Center(child: Text('Are you sure?')),
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  storage.delete(key: 'username');
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()),
                                      (route) => false);
                                },
                                child: Text('Yes'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('No'),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  label: Text(
                    'Logout',
                    style: TextStyle(color: Colors.red),
                  ),
                  icon: Icon(
                    Icons.logout,
                    color: Colors.red,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  SizedBox buildItem({
    required String title,
    required IconData icon,
    required Function()? onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: onTap,
        child: Row(
          children: [
            const SizedBox(
              width: 5,
            ),
            Icon(
              icon,
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
                child: Text(
              title,
              style: TextStyle(color: Colors.grey),
            )),
            Icon(
              Icons.navigate_next_sharp,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
