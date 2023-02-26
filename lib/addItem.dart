import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Text("Add Items"),
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Lost Item *',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Name required';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      maxLines: 5,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: 'Description',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Description required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(border: Border.all()),
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        IconButton(
                            icon: const Icon(Icons.image_outlined),
                            onPressed: () {}),
                        IconButton(
                            icon: const Icon(Icons.camera_alt_outlined),
                            onPressed: () {
                              // _controller.remove(index);
                            }),
                      ],
                    ),
                    SizedBox(
                      height: 150,
                    ),
                    SizedBox(
                      width: 100,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 7, 182, 241),
                            shape: const StadiumBorder()),
                        child: const Text(
                          'Save',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ));
  }
}
