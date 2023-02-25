import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:track_it/SignUp.dart';
import 'package:track_it/personal.dart';

class LogIn extends StatefulWidget {
  LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
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
          top: 200,
          child: Container(
            height: double.maxFinite,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(38.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment,
                children: <Widget>[
                  const Text(
                    "Log in",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
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
                        // _formKey.currentState!.save();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUp()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 7, 182, 241),
                          shape: const StadiumBorder()),
                      child: const Text(
                        'Log in',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Text("Not registered yet?"),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => personal()),
                            );
                          },
                          child: const Text("Sign up"))
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
