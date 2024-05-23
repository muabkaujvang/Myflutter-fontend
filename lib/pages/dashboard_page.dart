import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/page1.dart';
import 'package:flutter_application_1/pages/setting_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Colors.blue[200],
      ),
      body: Builder(builder: (context) {
        if (index == 1) {
          return page1();
        }
        if (index == 2) {
          return const Center(
            child: Text('searchPage'),
          );
        }
        if (index == 3) {
          return Settingpage();
        }
        return HomePage();
      }),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notification_add), label: 'notification'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'settings'),
        ],
        backgroundColor: Colors.blue,
        currentIndex: index,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
      ),
    );
  }
}
