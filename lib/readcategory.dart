import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:ui';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:knows/constant.dart';
import 'package:knows/readpage.dart';
import 'models/Data_model.dart';
import 'getters.dart';
import 'package:carousel_slider/carousel_options.dart';

class readcategori extends StatefulWidget {
  String categoriname;
  Future<void> categorinuzz;
  List<Data>  categlist;
  readcategori({Key? key,required this.categoriname,required this.categorinuzz,required this.categlist}) : super(key: key);

  @override
  State<readcategori> createState() => _readcategoriState();
}

class _readcategoriState extends State<readcategori> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 60),
            Container(
              child: Row(children: [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: DefaultTextStyle(
                        style: TextStyle(fontSize: 30, color: Colors.white),
                        child: Text(widget.categoriname),
                      )),
                ),
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
              ]),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Divider(
                height: 5,
                color: Colors.white,
              ),
            ),
            Center(
              child: SizedBox(
                height: widget.categlist.length*202.toDouble(),
                // width: double.infinity,
                child: FutureBuilder(
                  future: widget.categorinuzz,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else {
                      return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: widget.categlist.length,
                          itemBuilder: (context, idx) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => read_page(
                                      tittle: widget.categlist[idx].title.toString(),
                                      content: widget.categlist[idx].content.toString(),
                                      author: widget.categlist[idx].author.toString(),
                                      imageurl: widget.categlist[idx].imageUrl.toString(),
                                      readmore:
                                          widget.categlist[idx].readMoreUrl.toString(),
                                    ),
                                  ),
                                );
                              },
                              child: SizedBox(
                                height: 200,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: kcard,
                                  ),
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 12),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 15,
                                            bottom: 15,
                                            left: 10,
                                            right: 10),
                                        child: Container(
                                          width: 130,
                                          height: 130,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          // padding: EdgeInsets.all(25),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(20),
                                            child: FittedBox(
                                              alignment: Alignment.center,
                                              fit: BoxFit.cover,
                                              child: Image.network(widget.categlist[idx]
                                                  .imageUrl
                                                  .toString()),
                                              clipBehavior: Clip.hardEdge,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topCenter,
                                        child: Column(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10),
                                              width: 160,
                                              margin: EdgeInsets.all(10),
                                              child: DefaultTextStyle(
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    overflow: TextOverflow.fade),
                                                child: Text(
                                                  widget.categlist[idx].title.toString(),
                                                  maxLines: 4,
                                                  style: TextStyle(
                                                      overflow: TextOverflow.clip),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Container(
                                                // padding: EdgeInsets.symmetric(horizontal: 10),
                                                width: 160,
                                                child: DefaultTextStyle(
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    overflow: TextOverflow.fade,
                                                    color: Colors.grey,
                                                  ),
                                                  child: Text(widget.categlist[idx]
                                                          .author
                                                          .toString() +
                                                      '  |   ' +
                                                      widget.categlist[idx]
                                                          .date
                                                          .toString()),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
