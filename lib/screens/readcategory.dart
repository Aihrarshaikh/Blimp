import 'package:flutter/material.dart';
import 'package:knows/constants/constant.dart';
import 'package:knows/models/apiservices.dart';
import 'package:knows/screens/readpage.dart';
import '../models/data_model.dart';

class Readcategory extends StatefulWidget {
  String categoryname;

  Readcategory({Key? key, required this.categoryname}) : super(key: key);

  @override
  State<Readcategory> createState() => _ReadcategoryState();
}

class _ReadcategoryState extends State<Readcategory> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 60),
          Row(children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: DefaultTextStyle(
                    style: const TextStyle(fontSize: 30, color: Colors.white),
                    child: Text(widget.categoryname),
                  )),
            ),
            const Align(
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              height: 5,
              color: Colors.white,
            ),
          ),
          Center(
            child: FutureBuilder(
              future: ApiService().getnews(widget.categoryname),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return SizedBox(
                    height: snapshot.data.length * 202.toDouble(),
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Read_page(
                                    tittle:
                                        snapshot.data[index].title.toString(),
                                    content:
                                        snapshot.data[index].content.toString(),
                                    author:
                                        snapshot.data[index].author.toString(),
                                    imageurl: snapshot.data[index].imageUrl
                                        .toString(),
                                    readmore: snapshot.data[index].readMoreUrl
                                        .toString(),
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
                                margin: const EdgeInsets.symmetric(
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
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: FittedBox(
                                            alignment: Alignment.center,
                                            fit: BoxFit.cover,
                                            clipBehavior: Clip.hardEdge,
                                            child: Image.network(snapshot
                                                .data[index].imageUrl
                                                .toString()),
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
                                                snapshot.data[index].title
                                                    .toString(),
                                                maxLines: 4,
                                                style: TextStyle(
                                                    overflow:
                                                        TextOverflow.clip),
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
                                                child: Text(snapshot
                                                        .data[index].author
                                                        .toString() +
                                                    '  |   ' +
                                                    snapshot.data[index].date
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
                        }),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
