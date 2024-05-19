import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.person,
                    size: 50,
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(40),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                            alignment: Alignment.center,
                            child:
                                Text('Login', style: TextStyle(fontSize: 30))),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Username'),
                        TextField(
                          decoration: InputDecoration(
                              hintText: "Username",
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(15)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(15)),
                              filled: true,
                              fillColor: Colors.grey.shade100,
                              prefixIcon: const Icon(Icons.person)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Password'),
                        TextField(
                          obscureText: showPassword,
                          decoration: InputDecoration(
                              hintText: "Password",
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(15)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(15)),
                              filled: true,
                              fillColor: Colors.grey.shade100,
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      showPassword = !showPassword;
                                    });
                                  },
                                  icon: showPassword
                                      ? Icon(Icons.visibility_off)
                                      : Icon(Icons.visibility))),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 45,
                          child: ElevatedButton(
                              onPressed: () {}, child: Text('Login')),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Version:1.0.0',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'CopyRight 2024. All reserved',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
