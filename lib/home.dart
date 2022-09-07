import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:knows/constant.dart';
import 'package:knows/models/apiservices.dart';
import 'package:knows/readcategory.dart';
import 'package:knows/readpage.dart';

List<String> category = [
  'technology',
  'science',
  'national',
  'business',
  'sports',
  'world',
  'politics',
  'startup',
  'entertainment',
  'miscellaneous',
  'automobile',
  'all',
];

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  late int newscategoryindex = 0;
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: kbasic),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Row(children: const [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: DefaultTextStyle(
                      style: TextStyle(fontSize: 30, color: Colors.white),
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Divider(
                height: 5,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 400,
              child: FutureBuilder(
                  future: ApiService().getnews('science'),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return CarouselSlider.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index,
                            int pageViewIndex) {
                          return Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Read_page(
                                        tittle: snapshot.data[index].title
                                            .toString(),
                                        content: snapshot.data[index].content
                                            .toString(),
                                        author: snapshot.data[index].author
                                            .toString(),
                                        imageurl: snapshot.data[index].imageUrl
                                            .toString(),
                                        readmore: snapshot
                                            .data[index].readMoreUrl
                                            .toString(),
                                      ),
                                    ));
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: Stack(children: [
                                  SizedBox(
                                    width: 280,
                                    height: 350,
                                    child: FittedBox(
                                      alignment: Alignment.center,
                                      fit: BoxFit.cover,
                                      clipBehavior: Clip.hardEdge,
                                      child: Image.network(snapshot
                                          .data[index].imageUrl
                                          .toString()),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: BlurryContainer(
                                      blur: 5,
                                      width: 280,
                                      height: 160,
                                      elevation: 8,
                                      color: Colors.transparent,
                                      padding: const EdgeInsets.all(8),
                                      borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(24),
                                          bottomRight: Radius.circular(24)),
                                      child: DefaultTextStyle(
                                        style: const TextStyle(
                                            fontSize: 18,
                                            overflow: TextOverflow.fade),
                                        child: Text(snapshot.data[index].title
                                            .toString()),
                                      ),
                                    ),
                                  )
                                ]),
                              ),
                            ),
                          );
                        },
                        options: CarouselOptions(
                          height: 390,
                          viewportFraction: 0.7,
                          autoPlay: true,
                          autoPlayInterval:
                              const Duration(seconds: 2, microseconds: 50),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          // enlargeCenterPage: true,
                        ),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
            ),
            Container(
              height: 20,
              color: kbasic,
            ),
            SizedBox(
              height: 55,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 12,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(left: 8, right: 8),
                    padding: const EdgeInsets.only(top: 3, right: 11),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24), color: kcard),
                    child: Center(
                      child: Row(children: [
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          child: GestureDetector(
                            onDoubleTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Readcategory(categoryname: category[index])),
                              );
                            },
                            onTap: () {
                              setState(() {
                                newscategoryindex = index;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Align(
                                  alignment: Alignment.topLeft,
                                  child: DefaultTextStyle(
                                    style: const TextStyle(
                                        fontSize: 30, color: Colors.white),
                                    child: Text(category[index]),
                                  )),
                            ),
                          ),
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
                    ),
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8, right: 16, left: 16),
              child: Divider(
                height: 5,
                color: Colors.white,
              ),
            ),
            Center(
              child: FutureBuilder(
                future: ApiService().getnews(category[newscategoryindex]),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return SizedBox(
                      height: snapshot.data.length * 211.toDouble(),
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
                                      content: snapshot.data[index].content
                                          .toString(),
                                      author: snapshot.data[index].author
                                          .toString(),
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
                                width: MediaQuery.of(context).size.width,
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
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              width: 160,
                                              margin: const EdgeInsets.all(10),
                                              child: DefaultTextStyle(
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    overflow:
                                                        TextOverflow.fade),
                                                child: Text(
                                                  snapshot.data[index].title
                                                      .toString(),
                                                  maxLines: 4,
                                                  style: const TextStyle(
                                                      overflow:
                                                          TextOverflow.clip),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomLeft,
                                              child: SizedBox(

                                                width: 160,
                                                child: DefaultTextStyle(
                                                  style:const TextStyle(
                                                    fontSize: 12,
                                                    overflow: TextOverflow.fade,
                                                    color: Colors.grey,
                                                  ),
                                                  child: Text('${snapshot
                                                          .data[index].author}  |   ${snapshot.data[index].date}'),
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
      ),
    );
  }
}
