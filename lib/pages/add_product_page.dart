import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/components/my_button.dart';
import 'package:flutter_application_1/components/my_textformfeil.dart';
import 'package:flutter_application_1/model/product_model.dart';
import 'package:flutter_application_1/pages/product.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage(
      {super.key, required this.isAdd, this.productModel, this.index});
  final bool isAdd;
  final ProductModel? productModel;
  final int? index;

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  TextEditingController nameCtrl = TextEditingController();
  // TextEditingController cateCtrl = TextEditingController();
  TextEditingController priceCtrl = TextEditingController();
  //TextEditingController unitCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final List<TextInputFormatter> inputFormatters = <TextInputFormatter>[
    FilteringTextInputFormatter.digitsOnly,
  ];

  List categoryList = ['Food', 'Drink', 'Fruit'];
  String? categorySelected;
  List unitList = ['Buttle', '10kg', 'package'];
  String? unitSelected;
  bool isCheck = false;
  onAdd() {
    setState(() {
      isCheck = true;
    });
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      try {
        proList.add(
          ProductModel(
            id: 1,
            name: nameCtrl.text,
            category: categorySelected ?? '',
            price: double.parse(priceCtrl.text),
            unit: unitSelected ?? '',
          ),
        );
      } catch (e) {}
      Navigator.pop(context);
    }
  }

  onUpdate() {
    setState(() {
      isCheck = true;
    });
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      try {
        proList[widget.index!] = ProductModel(
            id: 1,
            name: nameCtrl.text,
            category: categorySelected ?? '',
            price: double.parse(priceCtrl.text),
            unit: unitSelected ?? '');
      } catch (e) {}
      Navigator.pop(context);
    }
  }

  onInitalData() {
    if (widget.isAdd == false && widget.productModel != null) {
      nameCtrl.text = widget.productModel!.name;
      categorySelected = widget.productModel!.category;
      unitSelected = widget.productModel!.unit;
      priceCtrl.text = widget.productModel!.price.toString();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onInitalData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isAdd ? 'Add product' : "Update product"),
        backgroundColor: Colors.blue[200],
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Product name'),
                SizedBox(
                  height: 5,
                ),
                MyTextFormField(
                  radius: 15,
                  controller: nameCtrl,
                  hintText: 'Enter product name',
                  validator: (String? val) {
                    if (val!.isEmpty) {
                      return 'Please enter product name';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Text('Category'),
                SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      borderRadius: BorderRadius.circular(16),
                      hint: const Text('Select category'),
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      isExpanded: true,
                      icon: Icon(Icons.keyboard_arrow_down),
                      value: categorySelected,
                      items: categoryList.map((e) {
                        return DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          categorySelected = val.toString();
                        });
                      },
                    ),
                  ),
                ),
                isCheck
                    ? categorySelected == null
                        ? const Text(
                            'Please select category',
                            style: TextStyle(color: Colors.red),
                          )
                        : Container()
                    : Container(),

                // TextField(
                //     controller: cateCtrl,
                //     decoration: InputDecoration(
                //       hintText: "Enter Category",
                //       enabledBorder: OutlineInputBorder(
                //           borderSide: BorderSide(),
                //           borderRadius: BorderRadius.circular(15)),
                //       focusedBorder: OutlineInputBorder(
                //           borderSide: const BorderSide(color: Colors.blue),
                //           borderRadius: BorderRadius.circular(15)),
                //       filled: true,
                //       fillColor: Colors.grey.shade100,
                //     )),
                SizedBox(
                  height: 20,
                ),
                Text('Price'),
                SizedBox(
                  height: 5,
                ),
                Container(
                  child: MyTextFormField(
                    keyType: TextInputType.number,
                    radius: 15,
                    controller: priceCtrl,
                    hintText: 'Enter price',
                    validator: (String? val) {
                      if (val!.isEmpty) {
                        return 'Please enter price';
                      }
                      return null;
                    },
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text('Unit'),
                SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(16)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      borderRadius: BorderRadius.circular(16),
                      hint: const Text('Select unit'),
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      isExpanded: true,
                      icon: Icon(Icons.keyboard_arrow_down),
                      value: unitSelected,
                      items: unitList.map((e) {
                        return DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          unitSelected = val.toString();
                        });
                      },
                    ),
                  ),
                ),
                Builder(
                  builder: (context) {
                    if (isCheck) {
                      if (unitSelected == null) {
                        return const Text(
                          'please select unit',
                          style: TextStyle(color: Colors.red),
                        );
                      }
                    }
                    return Container();
                  },
                ),

                SizedBox(
                  height: 20,
                ),
                MyButton(
                  tittle: 'save',
                  onPressed: () {
                    if (widget.isAdd) {
                      onAdd();
                    } else {
                      onUpdate();
                    }
                  },
                  icon: Icon(Icons.download),
                  bgColor: Colors.blue[200],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
