import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

class CamasirDetayPage extends StatefulWidget {
  final int index;
  CamasirDetayPage({this.index});

  @override
  _CamasirDetayPageState createState() => _CamasirDetayPageState();
}

class _CamasirDetayPageState extends State<CamasirDetayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("CamasirDetay")
                .snapshots(),
            builder: (context, snapshot) {
              // print("deneme 1234 " + widget.index.toString());
              return !snapshot.hasData
                  //loading page is here
                  ? Scaffold(
                      backgroundColor: Colors.white,
                      body: Container(
                        child: LoadingFlipping.circle(
                          borderColor: Colors.white,
                          borderSize: 3.0,
                          size: 75.0,
                          backgroundColor: Colors.white,
                          duration: Duration(milliseconds: 500),
                        ),
                      ),
                    )
                  : Center(
                      child: Scaffold(
                        body: Container(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Center(
                                  child: Text(
                                    snapshot.data.docs[widget.index]["baslik"],
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  child: Image.network(
                                      snapshot.data.docs[widget.index]["foto"]),
                                ),
                                Text(snapshot.data.docs[widget.index]["icerik"],
                                    style: TextStyle(fontSize: 18)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
            },
          ),
        ),
      ),
    );
  }
}
