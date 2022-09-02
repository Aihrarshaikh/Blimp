import 'dart:convert';
import 'dart:ui';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:knows/constant.dart';
import 'package:knows/readpage.dart';
import 'models/Data_model.dart';
import 'getters.dart';
List<Data> nuzzscience = [];
List<Data> nuzztech = [];
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Data> nuzzs = [];
  Future<void> getallnuz() async {
    final response = await http.get(Uri.parse('https://inshorts.deta.dev/news?category=all'));
    var jsonData = jsonDecode(response.body);
    if (jsonData['success']==true) {
jsonData['data'].forEach((element){
      if(element['readMoreUrl']!=null){
        Data data = Data(
            author : element['author'],
            content : element['content'],
            date : element['date'],
        imageUrl : element['imageUrl'],
        readMoreUrl : element['readMoreUrl'],
        time : element['time'],
        title : element['title'],
        url : element['url'],
        );
        nuzzs.add(data);
      }
});
    }
  }
  Future<void> gettechnews() async {
    final response = await http.get(Uri.parse('https://inshorts.deta.dev/news?category=technology'));
    var jsonData = jsonDecode(response.body);
    if (jsonData['success']==true) {
      jsonData['data'].forEach((element){
        if(element['readMoreUrl']!=null){
          Data data = Data(
            author : element['author'],
            content : element['content'],
            date : element['date'],
            imageUrl : element['imageUrl'],
            readMoreUrl : element['readMoreUrl'],
            time : element['time'],
            title : element['title'],
            url : element['url'],
          );
          nuzztech.add(data);
        }
      });
    }
  }
  @override
  void initState(){
    getallnuz();
    gettechnews();
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
                      return ListView.builder(
                          physics: ClampingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: nuzzs.length,
                          itemBuilder: (context, idx) {
                            return Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => read_page(ss:nuzzs[idx].content.toString())),
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
                          });
                    }
                  }),
            ),
            SizedBox(height: 40,
            child: Container(
              color: kbasik,
            ),),
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
                        child: Text('Technology'),
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
              padding: EdgeInsets.symmetric(horizontal: 16 ,vertical: 10),
              child: Divider(
                height: 5,
                color: Colors.white,
              ),
            ),
            // SizedBox(height: 180),
            Center(
              child: SizedBox(
                height: nuzztech.length*201.toDouble(),
                // width: double.infinity,
                child: FutureBuilder(
                  future: gettechnews(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: nuzztech.length,
                          itemBuilder: (context, idx) {
                            return GestureDetector(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => read_page(ss: nuzztech[idx].content.toString(),)),
                                );
                              },
                              child: SizedBox(
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
                                              child: Image.network(nuzztech[idx].imageUrl.toString()),
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
                                                  child: Text(nuzztech[idx].title.toString(),maxLines: 4,
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
                                                    child: Text(nuzztech[idx].author.toString()+'  |   ' + nuzztech[idx].date.toString()),
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
