import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/api_path.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final storage = const FlutterSecureStorage();
  String? username;
  String? imageUrl;

  getUsername() async {
    username = await storage.read(key: 'username');
    imageUrl = await storage.read(key: 'image');
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsername();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        elevation: 0,
        backgroundColor: Colors.blue[200],
      ),
      backgroundColor: Colors.blue[200],
      body: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.blue[200],
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  left: 20,
                  right: 20,
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[700],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '${username}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: 30,  
                    left: 0,
                    right: 0,
                    child: Container(
                      // height: 100,
                      // width: 100,
                      // color: Colors.blue,
                      child: Center(
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue, width: 2),
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(100)),
                          child: imageUrl == null
                              ? Container()
                              : ClipRRect(
                                child: Image.network(
                                    '${ApiPath.PROFILE}${imageUrl}', fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(50),
                              ),
                        ),
                      ),
                    ))
              ],
            ),
          ),
          Container(
            //height: 300,
            width: double.infinity,
            padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
            margin: const EdgeInsets.only(right: 20, left: 20),
            decoration: BoxDecoration(
              color: Colors.grey[700],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: const Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Firstname',
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      'Meng',
                      style: TextStyle(color: Colors.blue),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Lastname',
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      'Vang',
                      style: TextStyle(color: Colors.blue),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Birthday',
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      '10/10/1987',
                      style: TextStyle(color: Colors.blue),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Gender',
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      'man',
                      style: TextStyle(color: Colors.blue),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Calls',
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      '12345678',
                      style: TextStyle(color: Colors.blue),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
