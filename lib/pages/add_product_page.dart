import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_application_1/model/category_model_page.dart';
import 'package:flutter_application_1/model/product_list_model.dart';
import 'package:flutter_application_1/model/unit_model_page.dart';
import 'package:flutter_application_1/pages/categyory_page.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/api_path.dart';
import 'package:flutter_application_1/components/my_button.dart';
import 'package:flutter_application_1/components/my_textformfeil.dart';
import 'package:flutter_application_1/model/product_model.dart';
import 'package:flutter_application_1/pages/product.dart';
import 'package:http/http.dart' as http;
import 'dart:html' as html;
import 'package:flutter/foundation.dart' show kIsWeb;

class AddProductPage extends StatefulWidget {
  const AddProductPage(
      {super.key, required this.isAdd, this.productModel, this.index});
  final bool isAdd;
  final ProductListModel? productModel;
  final int? index;

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  TextEditingController nameCtrl = TextEditingController();
  // TextEditingController cateCtrl = TextEditingController();
  TextEditingController priceCtrl = TextEditingController();
  TextEditingController costCtrl = TextEditingController();
  //TextEditingController unitCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final List<TextInputFormatter> inputFormatters = <TextInputFormatter>[
    FilteringTextInputFormatter.digitsOnly,
  ];

  CategoryModel? categorySelected;
  int? cateId;
  UnitModel? unitSelected;
  int? unitId;
  bool isCheck = false;
  File? imgFile;
  bool saving = false;
  Uint8List? imgBytes;
  String? imgName;
  bool imgUpload = false;

  Future<File?> pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return null;
    File? img = File(image.path);
    setState(() {
      imgFile = img;
    });
    uploadImageToServer();
    return img;
  }

  List<CategoryModel> cateData = [];
  getCagetgory() async {
    var request = http.Request('GET', Uri.parse(ApiPath.BASE_URL + 'category'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());
      var body = jsonDecode(await response.stream.bytesToString());
      cateData = categoryModelFromJson(jsonEncode(body['data']));
      print('catedata==$cateData');
      setState(() {});
    } else {
      print(response.reasonPhrase);
    }
  }

  List<UnitModel> unitData = [];
  getUnit() async {
    var request = http.Request('GET', Uri.parse(ApiPath.BASE_URL + 'unit'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());
      var body = jsonDecode(await response.stream.bytesToString());
      unitData = unitModelFromJson(jsonEncode(body['data']));
      print('catedata==$unitData');
      setState(() {});
    } else {
      print(response.reasonPhrase);
    }
  }

  uploadImageToServer() async {
    try {
      setState(() {
        imgUpload = true;
      });
      var request = http.MultipartRequest(
          'POST', Uri.parse(ApiPath.BASE_UPLOAD + 'upload/images'));
      request.files
          .add(await http.MultipartFile.fromPath('file', imgFile!.path));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
        var data = jsonDecode(await response.stream.bytesToString());
        setState(() {
          imgName = data['data'];
        });
        setState(() {
          imgUpload = false;
        });
      } else {
        setState(() {
          imgUpload = false;
        });
        print(response.reasonPhrase);
      }
    } catch (e) {
      setState(() {
        imgUpload = false;
      });
      log('Error while upload image to server= $e');
    }
  }

  void uploadImageToServerForChrome() async {
    try {
      // Create a file input element
      html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
      uploadInput.accept = 'image/*';
      uploadInput.click();

      uploadInput.onChange.listen((e) async {
        final files = uploadInput.files;
        if (files != null && files.isNotEmpty) {
          setState(() {
            imgUpload = true;
          });
          final file = files[0];
          final reader = html.FileReader();

          reader.onLoadEnd.listen((e) async {
            final bytes = reader.result as List<int>;
            setState(() {
              imgBytes = Uint8List.fromList(bytes);
            });
            var request = http.MultipartRequest(
                'POST', Uri.parse(ApiPath.BASE_UPLOAD + 'upload/images'));
            request.files.add(http.MultipartFile.fromBytes(
              'file',
              bytes,
              filename: file.name,
            ));

            http.StreamedResponse response = await request.send();

            if (response.statusCode == 200) {
              //print(await response.stream.bytesToString());
              var data = jsonDecode(await response.stream.bytesToString());
              setState(() {
                imgName = data['data'];
              });
              setState(() {
                imgUpload = false;
              });
            } else {
              setState(() {
                imgUpload = false;
              });
              print(response.reasonPhrase);
            }
          });

          reader.readAsArrayBuffer(file);
        }
      });
    } catch (e) {
      setState(() {
        imgUpload = false;
      });
      log('Error while uploading image to server: $e');
    }
  }

  onAdd() async {
    setState(() {
      isCheck = true;
    });
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      try {
        setState(() {
          saving = true;
        });
        var headers = {'Content-Type': 'application/json'};
        var request =
            http.Request('POST', Uri.parse(ApiPath.BASE_URL + 'product'));
        request.body = jsonEncode({
          "pro_name": nameCtrl.text,
          "cate_id": categorySelected!.cateId,
          "unit_id": unitSelected!.unitId,
          "price": priceCtrl.text,
          "cost": costCtrl.text,
          "image": imgName ?? '',
        });
        request.headers.addAll(headers);

        http.StreamedResponse response = await request.send();

        if (response.statusCode == 200) {
          // print(await response.stream.bytesToString());
          Navigator.pop(context);
        } else {
          print(response.reasonPhrase);
        }
        if (response.statusCode == 200) {
          print('add success');
        }

        setState(() {
          saving = false;
        });
      } catch (e) {
        print(e);
        setState(() {
          saving = false;
        });
      }
    }
  }

  onUpdate() async {
    setState(() {
      isCheck = true;
    });
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      try {
        var id = widget.productModel!.proId;
        var headers = {'Content-Type': 'application/json'};
        var request =
            http.Request('PUT', Uri.parse(ApiPath.BASE_URL + 'product/$id'));
        request.body = jsonEncode({
          "pro_name": nameCtrl.text,
          "cate_id": categorySelected!.cateId,
          "unit_id": unitSelected!.unitId,
          "price": priceCtrl.text,
          "cost": costCtrl.text,
          "image": imgName ?? '',
        });
        request.headers.addAll(headers);

        http.StreamedResponse response = await request.send();

        if (response.statusCode == 200) {
          // print(await response.stream.bytesToString());
          Navigator.pop(context, true);
        } else {
          print(response.reasonPhrase);
        }
        if (response.statusCode == 200) {
          print('add success');
        }
      } catch (e) {}
    }
  }

  bool loading = false;
  onInitalData() async {
    loading = true;
    await getCagetgory();
    await getUnit();
    if (widget.isAdd == false && widget.productModel != null) {
      nameCtrl.text = widget.productModel!.proName;
      categorySelected = widget.productModel!.category;
      unitSelected = widget.productModel!.unit;
      priceCtrl.text = widget.productModel!.price.toString();
      costCtrl.text = widget.productModel!.cost.toString();
      imgName = widget.productModel!.image;
      setState(() {});
    }
    loading = false;
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
      body: Builder(builder: (context) {
        if (loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        if(kIsWeb){
                          uploadImageToServerForChrome();
                        }else{
                          pickImage(ImageSource.gallery);
                        };
                      },
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: imgUpload
                              ? Center(child: CircularProgressIndicator())
                              : kIsWeb
                                  ? imgBytes == null
                                  ? widget.isAdd== false? Image.network(ApiPath.BASE_UPLOAD + 'upload/images/' + imgName!): Icon(Icons.image)
                                      : Image.memory(imgBytes!)
                                  : imgFile == null
                                      ? Icon(Icons.image)
                                      : Image.file(
                                          imgFile!,
                                          fit: BoxFit.cover,
                                        ),
                        ),
                      ),
                    ),
                  ),
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
                        hint: categorySelected == null
                            ? Text('Select category')
                            : Text(categorySelected!.cateName.toString()),
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        isExpanded: true,
                        icon: Icon(Icons.keyboard_arrow_down),
                        //value: categorySelected,
                        items: cateData.map((e) {
                          return DropdownMenuItem(
                            child: Text(e.cateName.toString()),
                            value: e,
                          );
                        }).toList(),
                        onChanged: (val) {
                          // log('value===$val');
                          setState(() {
                            categorySelected = val;
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
                  Text('cost'),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: MyTextFormField(
                      keyType: TextInputType.number,
                      radius: 15,
                      controller: costCtrl,
                      hintText: 'Enter cost',
                      validator: (String? val) {
                        if (val!.isEmpty) {
                          return 'Please enter cost';
                        }
                        return null;
                      },
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                  // Container(
                  //   child: Align(
                  //     alignment: Alignment.center,
                  //     child: GestureDetector(
                  //       onTap: () {
                  //         pickImage(ImageSource.gallery);
                  //       },
                  //       child: Container(
                  //         height: 100,
                  //         width: 100,
                  //         decoration: BoxDecoration(
                  //           color: Colors.blue.shade100,
                  //           border: Border.all(),
                  //           borderRadius: BorderRadius.circular(16),
                  //         ),
                  //         child: Icon(Icons.image),
                  //       ),
                  //     ),
                  //   ),
                  // ),
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
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        borderRadius: BorderRadius.circular(16),
                        hint: unitSelected == null
                            ? Text('select unit')
                            : Text(unitSelected!.unitName.toString()),
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        isExpanded: true,
                        icon: Icon(Icons.keyboard_arrow_down),
                        //value: unitSelected,
                        items: unitData.map((e) {
                          return DropdownMenuItem(
                            child: Text(e.unitName.toString()),
                            value: e,
                          );
                        }).toList(),
                        onChanged: (val) {
                          // log('value===$val');
                          setState(() {
                            unitSelected = val;
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
                    loading: saving,
                    tittle: 'save',
                    onPressed: () {
                      if (widget.isAdd) {
                        onAdd();
                      } else {
                        onUpdate();
                      }
                    },
                    icon: const Icon(Icons.download),
                    bgColor: Colors.blue[200],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
