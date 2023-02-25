// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'package:track_it/LogIn.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController passcontroller = TextEditingController();
  bool _isVisible = false;
  void updateStatus() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("asset/images/background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 150,
          child: Container(
            // height: double.maxFinite,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(38.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment,
                children: <Widget>[
                  const Text(
                    "Sign up",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: 'NAME *',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Name required';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'EMAIL *',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '* please Enter an email';
                      } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        return "Please Enter a Valid Email";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    obscureText: _isVisible ? false : true,
                    keyboardType: TextInputType.number,
                    controller: passcontroller,
                    decoration: InputDecoration(
                      labelText: 'PASSWORD *',
                      suffixIcon: IconButton(
                        onPressed: () => updateStatus(),
                        icon: Icon(_isVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '* please Enter a password';
                      } else if (passcontroller.text.length != 6) {
                        return "Password must be 6 digits";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LogIn()),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 7, 182, 241),
                          shape: const StadiumBorder()),
                      child: const Text(
                        'Sign up',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Text("Already registered ?"),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LogIn()),
                            );
                          },
                          child: const Text("Log in"))
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
