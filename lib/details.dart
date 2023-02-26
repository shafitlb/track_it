import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

// ignore: camel_case_types
class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text("Details"),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(50),
            // padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            height: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("asset/images/wallet.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
              child: Text(
            "Wallet",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          )),
          Container(
            padding: EdgeInsets.all(16),
            child: Text(
                "Wallet is placed in the living room side drawyer, hhdifjuhsihgdfiuagshdfiaifagsdfgadfgdagfgahdfgihfdiuhfiuhdhfihdsaiufhasidufhiudsfiudshfiuhdfh"),
          )
        ],
      ),
    );
  }
}
