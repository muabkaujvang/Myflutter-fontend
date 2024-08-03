import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/api_path.dart';
import 'package:flutter_application_1/components/my_dialog.dart';
import 'package:flutter_application_1/model/product_list_model.dart';
import 'package:flutter_application_1/model/product_model.dart';
import 'package:flutter_application_1/pages/add_product_page.dart';
import 'package:http/http.dart' as http;

class Product extends StatefulWidget {
  const Product({Key? key}) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}

List<ProductModel> proList = [];

class _ProductState extends State<Product> {
  @override
  void initState() {
    super.initState();
    fetchProduct();
  }

  bool loading = false;
  List<ProductListModel> proData = [];

  Future<void> fetchProduct() async {
    try {
      setState(() {
        loading = true;
      });
      var response = await http.get(Uri.parse(ApiPath.BASE_URL + 'product'));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var data = productListModelFromJson(jsonEncode(body['data']));
        setState(() {
          proData = data;
        });
      }
      setState(() {
        loading = false;
      });
    } catch (e) {
      log('Error== $e');
      setState(() {
        loading = false;
      });
    }
  }

  Future<void> deleteProduct({required int id}) async {
    var request =
        http.Request('DELETE', Uri.parse(ApiPath.BASE_URL + 'product/$id'));
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var body = jsonDecode(await response.stream.bytesToString());
      if (body['status'] == 200) {
        fetchProduct();
      }
    } else {
      print(response.reasonPhrase);
    }
  }

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
                  if (value == true) {
                    fetchProduct();
                  }
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
            child: Builder(builder: (context) {
              if (loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                itemCount: proData.length,
                itemBuilder: (context, index) {
                  var product = proData[index];
                  return Container(
                    padding: EdgeInsets.all(15),
                    color: index % 2 == 0 ? Colors.white : Colors.grey[200],
                    child: Row(
                      children: [
                        Expanded(
                          child: product.image != null
                              ? SizedBox(
                                  width: 80,
                                  height: 60,
                                  child: Image.network(
                                    ApiPath.BASE_UPLOAD +
                                        'image/' +
                                        product.image!,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : SizedBox(
                                  width: 80,
                                  height: 60,
                                  child: Icon(Icons.image_not_supported),
                                ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(product.proName ?? 'No name'),
                        ),
                        Expanded(
                          child:
                              Text(product.category?.cateName ?? 'No category'),
                        ),
                        Expanded(
                          child: Text('${product.price ?? 'No price'}'),
                        ),
                        Expanded(
                          child: Text('${product.unit?.unitName ?? 'No unit'}'),
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
                                          builder: (context) => AddProductPage(
                                            isAdd: false,
                                            productModel: product,
                                            index: index,
                                          ),
                                        ),
                                      ).then(
                                        (value) {
                                          if (value == true) {
                                            fetchProduct();
                                          }
                                        },
                                      );
                                    },
                                    icon: Icon(Icons.edit)),
                              ),
                              Expanded(
                                child: IconButton(
                                  onPressed: () {
                                    MyDialog().warningDialog(
                                      context: context,
                                      tittle: 'Are you sure?',
                                      onYes: () {
                                        Navigator.pop(context);
                                        deleteProduct(id: product.proId!);
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
              );
            }),
          )
        ],
      ),
    );
  }
}
