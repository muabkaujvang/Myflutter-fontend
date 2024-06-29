import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/menu_model.dart';
import 'package:flutter_application_1/pages/categyory_page.dart';
import 'package:flutter_application_1/pages/product.dart';
import 'package:flutter_application_1/pages/users_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MenuModel> menuList = [
    MenuModel(
      id: 1,
      title: 'product',
      icon: const Icon(
        Icons.production_quantity_limits,
        color: Colors.blue,
        size: 30,
      ),
      page: const Product(),
    ),
    MenuModel(
      id: 2,
      title: 'Categyory',
      icon: const Icon(
        Icons.category,
        color: Colors.blue,
        size: 30,
      ),
      page: CategyoryPage(),
    ),
    MenuModel(
      id: 7,
      title: 'Unit',
      icon: const Icon(
        Icons.type_specimen,
        color: Colors.blue,
        size: 30,
      ),
      page: Container(),
    ),
    MenuModel(
      id: 3,
      title: 'Order',
      icon: const Icon(
        Icons.import_export_outlined,
        color: Colors.blue,
        size: 30,
      ),
      page: Container(),
    ),
    MenuModel(
      id: 4,
      title: 'Sale',
      icon: const Icon(
        Icons.sell,
        color: Colors.blue,
        size: 30,
      ),
      page: Container(),
    ),
    MenuModel(
      id: 5,
      title: 'Stock',
      icon: const Icon(
        Icons.shape_line,
        color: Colors.blue,
        size: 30,
      ),
      page: Container(),
    ),
    MenuModel(
      id: 6,
      title: 'Users',
      icon: const Icon(
        Icons.group_outlined,
        color: Colors.blue,
        size: 30,
      ),
      page: UsersPage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.blue[200],
      ),
      backgroundColor: Colors.grey[300],
      body: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        padding: EdgeInsets.all(5),
        children: List.generate(menuList.length, (index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => menuList[index].page),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2,
                      offset: Offset(
                        2,
                        2,
                      )),
                ],
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [menuList[index].icon, Text(menuList[index].title)],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
