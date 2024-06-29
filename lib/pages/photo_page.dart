import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/photo_model.dart';

class PhotoPage extends StatefulWidget {
  const PhotoPage({super.key});

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  List<PhotoModel> photoList = [];
  bool loading = false;

  Future<void> fetchPhoto() async {
    setState(() {
      loading = true;
    });
    var response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    if (response.statusCode == 200) {
      print('response====>${response.body}');

      photoList = photoModelFromJson(response.body);
      loading = false;
      setState(() {});

      //var data = jsonDecode(response.body);
      print('body ====>${photoList}');
    } else {}
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPhoto();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo'),
        backgroundColor: Colors.blue[200],
      ),
      body: Builder(
        builder: (context) {
          if (loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
              itemCount: photoList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://play-lh.googleusercontent.com/3ha-TO-wWZA8IofnlU6tWsYJiBCYbqs8hvhB6BQnct1PgsYpAZhCPMKoYggHOX9z-1qM=w526-h296-rw'),
                  ),
                  // leading: ClipRRect(
                  // borderRadius: BorderRadius.circular(10),
                  // child: Image.network(
                  //   'https://play-lh.googleusercontent.com/3ha-TO-wWZA8IofnlU6tWsYJiBCYbqs8hvhB6BQnct1PgsYpAZhCPMKoYggHOX9z-1qM=w526-h296-rw'),
                  // ),
                  title: Text(
                    photoList[index].title.toString(),
                  ),
                  subtitle: Text(
                    photoList[index].id.toString(),
                  ),
                );
              });
        },
      ),
    );
  }
}
