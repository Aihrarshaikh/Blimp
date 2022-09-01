import 'dart:convert';
import 'dart:ui';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:knows/constant.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var nuz;

  Future<void> getnews(String categori) async {
    final response = await http
        .get(Uri.parse('https://inshorts.deta.dev/news?category=${categori}'));
    if (response.statusCode == 200) {
      nuz = jsonDecode(response.body.toString());
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: kbasik),
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
                        style: TextStyle(fontSize: 30),
                        child: Text('Latest'),
                      )),
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: DefaultTextStyle(
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.yellowAccent,
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

            SizedBox(
              height: 350,
              child: FutureBuilder(
                  future: getnews('science'),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return ListView.builder(
                          physics: ClampingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: nuz['data'].length,
                          itemBuilder: (context, idx) {
                            return Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: Stack(children: [
                                  SizedBox(
                                    width:280,
                                    height: 350,
                                    child: FittedBox(
                                      alignment: Alignment.center,
                                      fit: BoxFit.cover,
                                      child: Image.network(nuz['data'][idx]['imageUrl']),
                                      clipBehavior: Clip.hardEdge,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: BlurryContainer(
                                      child: DefaultTextStyle(
                                        style: TextStyle(
                                            fontSize: 18,
                                            overflow: TextOverflow.fade),
                                        child: Text(nuz['data'][idx]['title']),
                                      ),
                                      blur: 5,
                                      width: 280,
                                      height: 150,
                                      elevation: 8,
                                      color: Colors.transparent,
                                      padding: const EdgeInsets.all(8),
                                      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(24) ,bottomRight: Radius.circular(24)),
                                    ),
                                  )
                                ]),
                              ),
                            );
                          });
                    }
                  }),
            ),
            // SizedBox(height: 180),
            SizedBox(
              height: nuz['data'].length*201.toDouble(),
              // width: double.infinity,
              child: FutureBuilder(
                future: getnews('entertainment'),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: nuz['data'].length,
                        itemBuilder: (context, idx) {
                          return SizedBox(
                            height: 200,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: kcard,
                              ),
                              margin: EdgeInsets.all(12),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child:Container(
                                      width: 150,
                                      height: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20)
                                      ),
                                      // padding: EdgeInsets.all(25),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: FittedBox(
                                          alignment: Alignment.center,
                                          fit: BoxFit.cover,
                                          child: Image.network(nuz['data'][idx]['imageUrl']),
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
                                          padding: EdgeInsets.symmetric( vertical: 10),
                                            width: 200,
                                            margin: EdgeInsets.all(10),
                                            child: DefaultTextStyle(
                                              style: TextStyle(fontSize: 14,
                                              overflow: TextOverflow.fade
                                              ),
                                              child: Text(nuz['data'][idx]['title'],maxLines: 4,
                                              style: TextStyle(
                                                overflow: TextOverflow.ellipsis
                                              ),),
                                            ),
                                          ),
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Container(
                                            // padding: EdgeInsets.symmetric(horizontal: 10),
                                            width: 200,
                                            child:
                                              DefaultTextStyle(
                                                style: TextStyle(fontSize: 12,
                                                    overflow: TextOverflow.fade,
                                                  color: Colors.grey,
                                                ),
                                                child: Text(nuz['data'][idx]['author']+'  |   ' + nuz['data'][idx]['date']),
                                              ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    ),
                                ],
                              ),
                            ),
                          );
                        }
                        );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
