import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/cate_textformfeil.dart';
import 'package:flutter_application_1/model/categyory_model_page.dart';
import 'package:flutter_application_1/pages/categyory_page.dart';

class AddCategyoryPage extends StatefulWidget {
  const AddCategyoryPage({super.key});

  @override
  State<AddCategyoryPage> createState() => _AddCategyoryPageState();
}

class _AddCategyoryPageState extends State<AddCategyoryPage> {
  TextEditingController nameCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isCheck = false;

  onAdd() {
    setState(() {
      isCheck = true;
    });
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      try {
        cateList.add(
          CategyoryModelPage(
            id: 1,
            name: nameCtrl.text,
          ),
        );
      } catch (e) {}
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Addcate'),
        backgroundColor: Colors.blue[200],
      ),
      body: Form(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name'),
                SizedBox(
                  height: 5,
                ),
                CateTextformfeil(
                  radius: 15,
                  controller: nameCtrl,
                  hinText: 'Enter name',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
