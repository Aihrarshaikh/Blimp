import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:knows/constants/constant.dart';

class Read_page extends StatelessWidget {
  String tittle;
  String content;
  String imageurl;
  String author;
  String readmore;
  // Image
  Read_page(
      {Key? key,
      required this.tittle,
      required this.content,
      required this.imageurl,
      required this.author,
      required this.readmore})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kbasic,
        title: Row(children: const [
          Align(
              alignment: Alignment.topLeft,
              child: DefaultTextStyle(
                style: TextStyle(fontSize: 30, color: Colors.white),
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
      backgroundColor: kbasic,
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24))),
                height: 300,
                width: double.infinity,
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: 300,
                  child: FittedBox(
                    alignment: Alignment.center,
                    fit: BoxFit.cover,
                    clipBehavior: Clip.hardEdge,
                    child: Image.network(imageurl),
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
            padding: const EdgeInsets.only(left: 18, right: 18, top: 10),
            child: Text(
              tittle,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 18, left: 18, top: 20),
            child: Divider(
              height: 8,
              color: Colors.white,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(18),
            child: Text(
              content,
              style: const TextStyle(color: Colors.grey),
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ]),
      ),
    );
  }
}
