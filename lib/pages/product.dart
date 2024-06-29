import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/my_dialog.dart';
import 'package:flutter_application_1/model/product_model.dart';
import 'package:flutter_application_1/pages/add_product_page.dart';

class Product extends StatefulWidget {
  const Product({Key? key}) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}

List<ProductModel> proList = [];

class _ProductState extends State<Product> {
  // void deleteItem(int index) {
  //   setState(() {
  //     proList.removeAt(index);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product list'),
        backgroundColor: Colors.blue[200],
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddProductPage(
                    isAdd: true,
                  ),
                ),
              ).then(
                (value) {
                  setState(() {});
                },
              );
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.grey,
            child: const Row(
              children: [
                Expanded(
                  child: Text(
                    'NO',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Items',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Category',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Price',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Unit',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Action',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: proList.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(10),
                  color: index % 2 == 0 ? Colors.white : Colors.grey[200],
                  child: Row(
                    children: [
                      Expanded(
                        child: Text('${index + 1}'),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(proList[index].name),
                      ),
                      Expanded(
                        child: Text(proList[index].category),
                      ),
                      Expanded(
                        child: Text('${proList[index].price}'),
                      ),
                      Expanded(
                        child: Text('${proList[index].unit}'),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                             AddProductPage(
                                          isAdd: false,
                                          productModel: proList[index],
                                          index: index,
                                        ),
                                      ),
                                    ).then(
                                      (value) {
                                        setState(() {});
                                      },
                                    );
                                  }, icon: Icon(Icons.edit)),
                            ),
                            Expanded(
                              child: IconButton(
                                // onPressed: () {
                                //   showDialog(
                                //     context: context,
                                //     builder: (context) => AlertDialog(
                                //       title: Text('Are you sure?'),
                                //       actions: [
                                //         TextButton(
                                //           onPressed: () {
                                //             deleteItem(index);
                                //             Navigator.pop(context);
                                //           },
                                //           child: Text('Yes'),
                                //         ),
                                //         TextButton(
                                //           onPressed: () {
                                //             Navigator.pop(context);
                                //           },
                                //           child: Text('No'),
                                //         ),
                                //       ],
                                //     ),
                                //   );
                                // },
                                onPressed: () {
                                  MyDialog().warningDialog(
                                    context: context,
                                    tittle: 'Are you sure?',
                                    onYes: () {
                                      proList.removeAt(index);
                                      Navigator.pop(context);
                                      setState(() {});
                                    },
                                  );
                                },
                                icon: Icon(Icons.delete),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
