import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../widgets/format_input_style.dart';
import '../logic/auth_service.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late String email;
  late String password;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade100,
        ),
        body: Container(
          color: Color(0xFF15171A),
          child: Center(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty || value == null) {
                          return 'this is req';
                        } else {
                          email = value;
                          return null;
                        }
                      },
                      decoration: forminputstyle(labelText: "Email"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty || value == null) {
                          return 'this is req';
                        } else {
                          password = value;
                          return null;
                        }
                      },
                      obscureText: true,
                      decoration: forminputstyle(labelText: "Password"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await Provider.of<AuthService>(context,
                                    listen: false)
                                .registerWithEmailAndPassword(email, password);
                            print("$email  $password");
                          }
                        },
                        child: Text("Register"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
