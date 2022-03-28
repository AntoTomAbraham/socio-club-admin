import 'dart:convert';
import 'package:chat_app_admin/screens/home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:chat_app_admin/services/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class storyscreen extends StatefulWidget {
  @override
  State<storyscreen> createState() => _storyscreenState();
}

class _storyscreenState extends State<storyscreen> {
  List ele = [1, 2, 34, 4, 5, 6, 7, 8, 9, 8, 7, 6];

  TextEditingController topicController = TextEditingController();
  List name = [];
  List id = [];
  List image = [];
  List end = [];
  int length = 0;
  static String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiYW50byIsImVtYWlsIjoiYW50b3RvbWFicmFoYW1AZ21haWwuY29tIiwiaWQiOiI2MjM1YjQwY2RhZjA5ZTA5OTlkNjhlY2MiLCJwaG90b3VybCI6Imh0dHBzOi8vdHNlMi5tbS5iaW5nLm5ldC90aD9pZD1PSVAuNlZySTFmZTdCWEJUX2ROUGczQkJYUUhhRW8mcGlkPUFwaSZQPTAmdz0yOTQmaD0xODQiLCJ1c2VybmFtZSI6ImFudG80NSIsInBob25lIjoiMzkzOTM5MzkzOSIsImlhdCI6MTY0Nzc1NDYzMCwiZXhwIjoxNjUwMzQ2NjMwfQ.EDzGwY-eqO2-uQ3dcr-x2m4iP0mFAo1_K_64a11typg";
  static Map<String, String> getAuthHeaderForGet() {
    // String token = userInfo.get('token')!;
    // if (token == null) throw new Exception('User is not logged in');
    return {
      'x-access-token': token,
      'Content-Type': 'application/json; charset=UTF-8'
    };
  }

  static const String API_HOST = 'https://socio-club-app.herokuapp.com/';
  static http.Client client = http.Client();
  Future<dynamic> getjson() async {
    print("enered into getstories");
    var header = getAuthHeaderForGet();
    var resp = await client.get(
      Uri.parse(API_HOST + 'stories'),
      headers: header,
    );
    print(resp.statusCode);
    print(json.decode(resp.body));
    if (resp.statusCode == 200) {
      print("not null");
      json.decode(resp.body).forEach((e) {
        if (e['author'] == "6235b40cdaf09e0999d68ecc") {
          id.add(e['_id']);
          image.add(e['story']);
          print(id);
          print(image);
          print(id.toSet().toList().length);
        }
        length = id.toSet().toList().length;
      });
      return json.decode(resp.body);
    } else {
      print("into null");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Stories"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            // Padding(
            //   padding: const EdgeInsets.only(left: 21.0, right: 21),
            //   child: Align(
            //     alignment: Alignment.centerLeft,
            //     child: Container(
            //       child: Text(
            //         "Add new Stories",
            //         style: TextStyle(color: Colors.black, fontSize: 22),
            //       ),
            //     ),
            //   ),
            // ),
            //SizedBox(height: 20),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     ElevatedButton(
            //       onPressed: () {},
            //       child: Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Text('Add Story'),
            //       ),
            //       style: ElevatedButton.styleFrom(
            //         shape: CircleBorder(),
            //         padding: EdgeInsets.all(24),
            //       ),
            //     ),
            //     Container(
            //       padding: const EdgeInsets.all(16.0),
            //       height: Get.height * .12,
            //       width: Get.width * .5,
            //       decoration: BoxDecoration(
            //           color: Colors.blue.shade200,
            //           border: Border.all(color: Colors.blueAccent.shade700)),
            //       child: Center(
            //         child: Text("Click the button to add new stories"),
            //       ),
            //     )
            //   ],
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 21.0, right: 21.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Post Story link',
                    contentPadding: const EdgeInsets.all(15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
                controller: topicController,
              ),
            ),
            SizedBox(height: 10),
            OutlinedButton(
              child: Text("Update"),
              onPressed: () async {
                var data = await APIService.postStory(topicController.text)
                    .then((value) {
                  if (value == true) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Center(child: Text("Successfull")),
                          );
                        });
                  } else {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Center(child: Text("Failed")),
                          );
                        });
                  }
                });
              },
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 21.0, right: 21),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Text(
                    "Recent Stories",
                    style: TextStyle(color: Colors.black, fontSize: 22),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: Get.height * .5,
              width: Get.width * 1,
              child: FutureBuilder(
                  future: getjson(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                          height: Get.height * .5,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: id.toSet().toList().length,
                            itemBuilder: ((context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 16.0, right: 5),
                                child: Container(
                                  height: Get.height * .4,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                          height: 200,
                                          child: Image.network(
                                              image.elementAt(index))),
                                      //"https://th.bing.com/th/id/OIP.mEoDAhF4ZZlRYn-0gtd0HgHaI5?w=164&h=196&c=7&r=0&o=5&dpr=1.5&pid=1.7"),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          // Column(
                                          //   children: [
                                          //     Icon(
                                          //       Icons.remove_red_eye,
                                          //       color: Colors.blue,
                                          //     ),
                                          //     Text("125")
                                          //   ],
                                          // ),
                                          //SizedBox(width: 39),
                                          GestureDetector(
                                            onTap: () async {
                                              await APIService.deleteStories(
                                                      id[index])
                                                  .then((value) {
                                                if (value == true) {
                                                  showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialog(
                                                          title: Center(
                                                              child: Text(
                                                                  "Successfull")),
                                                        );
                                                      });
                                                } else {
                                                  showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialog(
                                                          title: Center(
                                                              child: Text(
                                                                  "Failed")),
                                                        );
                                                      });
                                                }
                                              }).whenComplete(() {
                                                Get.to(homescreen());
                                              });
                                            },
                                            child: Icon(
                                              Icons.delete,
                                              color: Colors.blue,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ));
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
            ),
            //  Container(
            //       height: Get.height * .5,
            //       width: Get.width * 1,
            //       child: CarouselSlider(
            //         options: CarouselOptions(
            //           viewportFraction: 0.7,
            //           height: 400.0,
            //           enlargeCenterPage: true,
            //           enableInfiniteScroll: false,
            //         ),
            //         items: [1, 2, 3, 4, 5, 2, 4, 67, 7, 8, 9, 9].map((i) {
            //           return Builder(
            //             builder: (BuildContext context) {
            //               return Container(
            //                   width: MediaQuery.of(context).size.width,
            //                   margin: EdgeInsets.symmetric(horizontal: 5.0),
            //                   decoration: BoxDecoration(color: Colors.white),
            //                   child: Column(
            //                     children: [
            //                       Container(
            //                         height: Get.height * .4,
            //                         width: Get.width * 1 - 100,
            //                         child: Image.network(
            //                           "https://i.pinimg.com/originals/58/bd/4f/58bd4fc9ebfccc1f2de419529bbf1a12.jpg",
            //                         ),
            //                       ),
            //                       Row(
            //                         mainAxisAlignment:
            //                             MainAxisAlignment.spaceEvenly,
            //                         children: [
            //                           Column(
            //                             children: [
            //                               Icon(
            //                                 Icons.remove_red_eye,
            //                                 color: Colors.blue,
            //                               ),
            //                               Text("125")
            //                             ],
            //                           ),
            //                           Icon(
            //                             Icons.delete,
            //                             color: Colors.blue,
            //                           ),
            //                         ],
            //                       )
            //                     ],
            //                   ));
            //           )}
            //         }).toList(),
            //       ),
            //     );)}
          ],
        ),
      ),
    );
  }
}
