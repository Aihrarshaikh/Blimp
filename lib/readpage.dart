import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:knows/constant.dart';
// import 'package:knows/getters.dart';
import 'package:knows/models/Data_model.dart';
// import 'package:knows/webview.dart';
// import 'package:webview_flutter/webview_flutter.dart';
import 'home.dart';

class read_page extends StatelessWidget {
  String tittle;
  String content;
  String imageurl;
  String author;
  String readmore;
  // Image
  read_page({Key? key, required this.tittle, required this.content,required this.imageurl,required this.author, required this.readmore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kbasik,
        title:  Row(children: [
          Align(
              alignment: Alignment.topLeft,
              child: DefaultTextStyle(
                style: TextStyle(fontSize: 30,
                    color: Colors.white
                ),
                child: Text('Blimp'),
              )),
          Align(
              alignment: Alignment.topLeft,
              child: DefaultTextStyle(
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF29300),
                ),
                child: Text('.'),
              )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              height: 5,
              color: Colors.white,
            ),
          ),
        ]),
      ),
      backgroundColor: kbasik,
      body: SingleChildScrollView(
        child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(24),topRight: Radius.circular(24))
                    ),
                    height: 300,
                    width: double.infinity,
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      height: 300,
                      child: FittedBox(
                        alignment: Alignment.center,
                        fit: BoxFit.cover,
                        child: Image.network(imageurl),
                        clipBehavior: Clip.hardEdge,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    left: 20,
                    child: BlurryContainer(
                        elevation: 10,
                        blur: 3,
                        borderRadius: BorderRadius.circular(20),
                        child: Text(author)),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 18,right: 18,top: 10),
                child: Text(tittle,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),),
              ),
              Padding(
                padding: EdgeInsets.only(right: 18,left: 18,top: 20),
                child: Divider(
                  height: 8,
                  color: Colors.white,
                ),
              ),
              Container(
                padding: EdgeInsets.all(18),
                child: Text(content,
                  style: TextStyle(
                      color: Colors.grey
                  ),),
              ),
              SizedBox(height: 20,)
            ]
        ),
      ),
    );
  }
}
