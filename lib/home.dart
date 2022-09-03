import 'dart:convert';
import 'dart:ui';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:knows/constant.dart';
import 'package:knows/readcategory.dart';
import 'package:knows/readpage.dart';
import 'models/Data_model.dart';
import 'getters.dart';
import 'package:carousel_slider/carousel_options.dart';
List<String> cato = ['technology',
  'national',
  'business',
  'sports',
  'world',
  'politics',
  'startup',
  'entertainment',
  'miscellaneous',
  'science',
  'automobile',
  'all',];

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState(){
    getallnuz();
    gettech();
  }
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
                        style: TextStyle(fontSize: 30,
                            color: Colors.white
                        ),
                        child: Text('Blimp'),
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
            SizedBox(
              height: 400,
              child: FutureBuilder(
                  future: getallnuz(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return CarouselSlider.builder(
                        // physics: ClampingScrollPhysics(),
                        // scrollDirection: Axis.horizontal,
                        itemCount: nuzzs.length,
                        itemBuilder: (context, idx,o) {
                          return Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => read_page(tittle: nuzzs[idx].title.toString(),content:nuzzs[idx].content.toString(),
                                      author: nuzzs[idx].author.toString(),imageurl: nuzzs[idx].imageUrl.toString(),readmore: nuzzs[idx].readMoreUrl.toString(),
                                    ),)
                                );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: Stack(children: [
                                  SizedBox(
                                    width:280,
                                    height: 350,
                                    child: FittedBox(
                                      alignment: Alignment.center,
                                      fit: BoxFit.cover,
                                      child: Image.network(nuzzs[idx].imageUrl.toString()),
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
                                        child: Text(nuzzs[idx].title.toString()),
                                      ),
                                      blur: 5,
                                      width: 280,
                                      height: 160,
                                      elevation: 8,
                                      color: Colors.transparent,
                                      padding: const EdgeInsets.all(8),
                                      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(24) ,bottomRight: Radius.circular(24)),
                                    ),
                                  )
                                ]),
                              ),
                            ),
                          );
                        }, options: CarouselOptions(
                        height: 390,
                        viewportFraction: 0.7,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 2 , microseconds: 50),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        // enlargeCenterPage: true,
                      ),);
                    }
                  }),
            ),
            SizedBox(height: 20,
              child: Container(
                color: kbasik,
              ),),
            SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 12,
                itemBuilder: (context,idx){
                  return Container(
                    margin: EdgeInsets.only(left: 8,right: 8),
                    padding: EdgeInsets.only(top: 5,right: 11),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: kcard
                    ),
                    child: Row(children: [
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        color : kcard,
                        child: GestureDetector(
                          onTap : (){
                            setState((){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => readcategori()),
                              );
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: DefaultTextStyle(
                                  style: TextStyle(fontSize: 30,
                                      color: Colors.white
                                  ),
                                  child: Text(cato[idx]),
                                )),
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: DefaultTextStyle(
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFF29300),
                            ),
                            child: Text('.'),
                          )),
                    ]
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 5),
              child: Divider(
                height: 5,
                color: Colors.white,
              ),
            ),
            // SizedBox(height: 180),
            Center(
              child: SizedBox(
                height: technuzz.length*211.toDouble(),
                // width: double.infinity,
                child: FutureBuilder(
                  future: gettech(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return  CircularProgressIndicator();
                    } else {
                      return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: technuzz.length,
                          itemBuilder: (context, idx) {
                            return GestureDetector(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => read_page(tittle: technuzz[idx].title.toString(),content:technuzz[idx].content.toString(),
                                    author: technuzz[idx].author.toString(),imageurl: technuzz[idx].imageUrl.toString(),readmore: technuzz[idx].readMoreUrl.toString(),
                                  ),),
                                );
                              },
                              child: SizedBox(
                                height: 200,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: kcard,
                                  ),
                                  margin: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15 ,bottom: 15,left: 10,right: 10),
                                        child:Container(
                                          width: 130,
                                          height: 130,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20)
                                          ),
                                          // padding: EdgeInsets.all(25),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(20),
                                            child: FittedBox(
                                              alignment: Alignment.center,
                                              fit: BoxFit.cover,
                                              child: Image.network(technuzz[idx].imageUrl.toString()),
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
                                                child: Text(technuzz[idx].title.toString(),maxLines: 4,
                                                  style: TextStyle(
                                                      overflow: TextOverflow.clip
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
                                                  child: Text(technuzz[idx].author.toString()+'  |   ' + technuzz[idx].date.toString()),
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
                          }
                      );
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