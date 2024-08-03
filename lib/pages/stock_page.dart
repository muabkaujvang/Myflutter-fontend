import 'package:flutter/material.dart';

class StockPage extends StatefulWidget {
  const StockPage({super.key});

  @override
  State<StockPage> createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users page'),
        backgroundColor: Colors.blue[200],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey,
            child: Center(child: Text('Header')),
            width: double.infinity,
            height: 80,
          ),
          Container(
            color: Colors.blue,
            child: Center(child: Text('Header')),
            width: double.infinity,
            height: 80,
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        child: Center(child: Text('Header')),
                        height: 60,
                        color: Colors.black38,
                        margin: EdgeInsets.all(10),
                        // width: MediaQuery.of(context).size.width*0.7,
                      ),
                      Container(
                        color: const Color.fromARGB(255, 168, 203, 220),
                        margin: EdgeInsets.all(10),
                        height: 40,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('ລ/ດ'),
                            Text('ລາຍການ'),
                            Text('ຈຳນວນ'),
                            Text('ວັນທີ')
                          ],
                        ),
                        // width: MediaQuery.of(context).size.width*0.7,
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          color: Color.fromARGB(255, 47, 51, 53),
                          child: Center(child: Text('Header')),
                          // width: MediaQuery.of(context).size.width*0.7,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 150,
                  color: Color.fromARGB(255, 44, 72, 90),
                  child: Center(child: Text('Header')),
                  // width: MediaQuery.of(context).size.width * 0.3,
                ),
              ],
            ),
          ),
          Container(
            color: Colors.lightGreen,
            child: Center(child: Text('Header')),
            width: double.infinity,
            height: 80,
          )
        ],
      ),
    );
  }
}