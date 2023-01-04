import 'dart:convert';
import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pbl_kasir/utils/auth.dart';
import 'package:pbl_kasir/utils/base_url.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool gagal = false;
  String pesan = "";
  bool _isObscure = true;
  bool isloading = false;
  Future<void> login(BuildContext context) async {
    Uri url = Uri.parse("${BaseUrl.url}/login");
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          'email': emailController.text,
          'password': passwordController.text
        },
      ),
    );
    var json = jsonDecode(response.body);
    print(json);
    if (response.statusCode == 200) {
      if (json['status'] == 'Gagal') {
        setState(() {
          gagal = true;
          pesan = json['message'];
          isloading = false;
        });
      } else {
        setState(() {
          gagal = false;
          Auth.isLogin = true;
          json['content']['role'] == 'admin'
              ? Auth.isAdmin = true
              : Auth.isAdmin = false;
          Auth.token = "Bearer " + json['content']['access_token'];
        });
        print(Auth.token);
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', Auth.token);
        await prefs.setBool('isAdmin', Auth.isAdmin);
        Navigator.pushNamed(context, '/home');
      }
    } else {
      throw new FormatException("Kesalahan");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isloading == true
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(10),
              child: ListView(
                children: [
                  // ignore: prefer_const_constructors
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: Image.asset("assets/logo/sirdi.png"),
                  ),
                  gagal == true
                      ? Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            width: 100,
                            height: 80,
                            color: Colors.red,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                pesan,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      : Text(''),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email Wajib Di isi';
                              }
                              return null;
                            },
                            controller: emailController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Masukkan Email',
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password Wajib Di isi';
                              }
                              return null;
                            },
                            obscureText: _isObscure,
                            controller: passwordController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                },
                                icon: Icon(_isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 50,
                          width: double.infinity,
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: ElevatedButton(
                            child: const Text('Login'),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // Navigator.pushNamed(context, "/home");
                                setState(() {
                                  isloading = true;
                                });
                                login(context);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
