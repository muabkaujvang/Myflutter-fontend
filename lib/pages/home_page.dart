import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        padding: EdgeInsets.all(5),
        children: [
          Container(
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
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.production_quantity_limits,
                    size: 40,
                    color: Colors.blue,
                  ),
                  Text('product')
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.grey,
                    blurRadius: 7,
                    offset: Offset(
                      3,
                      3,
                    )),
              ],
            ),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person_add_alt,
                    size: 40,
                    color: Colors.blue,
                  ),
                  Text('person_add_alt')
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.grey,
                    blurRadius: 7,
                    offset: Offset(
                      3,
                      3,
                    )),
              ],
            ),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.book,
                    size: 40,
                    color: Colors.blue,
                  ),
                  Text('Book')
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.grey,
                    blurRadius: 7,
                    offset: Offset(
                      3,
                      3,
                    )),
              ],
            ),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.flutter_dash_outlined,
                    size: 40,
                    color: Colors.blue,
                  ),
                  Text('flutter_dash_outlined')
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.grey,
                    blurRadius: 7,
                    offset: Offset(
                      3,
                      3,
                    )),
              ],
            ),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.mobile_off_rounded,
                    size: 40,
                    color: Colors.blue,
                  ),
                  Text('mobile_off_rounded')
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.grey,
                    blurRadius: 7,
                    offset: Offset(
                      3,
                      3,
                    )),
              ],
            ),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.fiber_new,
                    size: 40,
                    color: Colors.blue,
                  ),
                  Text('fiber_new')
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10,
                    offset: Offset(
                      2,
                      2,
                    )),
              ],
            ),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.type_specimen,
                    size: 40,
                    color: Colors.blue,
                  ),
                  Text('type_spacimen')
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
