import 'dart:convert';
import 'package:chat_app_admin/screens/editscreen.dart';
import 'package:chat_app_admin/screens/home.dart';
import 'package:chat_app_admin/screens/home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:chat_app_admin/models/competitions.dart';
import 'package:chat_app_admin/services/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class contests extends StatefulWidget {
  @override
  State<contests> createState() => _contestsState();
}

class _contestsState extends State<contests> {
  List ele = [1, 2, 3, 4, 5, 6, 7, 8, 9, 8, 7, 6];

  List<String> compName = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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

  List name = [];
  List id = [];
  List start = [];
  List end = [];
  List img = [];
  int length = 0;
  static const String API_HOST = 'https://socio-club-app.herokuapp.com/';
  static http.Client client = http.Client();
  Future<dynamic> getjson() async {
    var header = getAuthHeaderForGet();
    var resp = await client.get(
      Uri.parse(API_HOST + 'admin/competitionsByDate'),
      headers: header,
    );
    print(resp.statusCode);
    print(json.decode(resp.body));
    if (resp.statusCode == 200) {
      print("not null");
      json.decode(resp.body).forEach((e) {
        if (e['author'] == "6235b40cdaf09e0999d68ecc") {
          print(e['topic']);
          name.add(e['topic']);
          img.add(e['image']);
          id.add(e['_id']);
          start.add(e['startDate']);
          end.add(e['endDate']);
          print(img);
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
        title: Text("Contests Insights"),
      ),
      body: SingleChildScrollView(
          child: Container(
        height: Get.height * 1,
        width: Get.width * 1,
        child: Padding(
          padding: const EdgeInsets.only(left: 21.0, right: 21.0),
          child: Column(
            children: [
              Container(
                height: Get.height * 1,
                width: Get.width * 1,
                child: FutureBuilder(
                  future: getjson(),
                  builder: (context, snapshot) {
                    print(snapshot.data);

                    //competition competitons = snapshot.data as competition;
                    //compName.add(competitons.topic as String);
                    return Container(
                        height: Get.height * 1,
                        child: ListView.builder(
                            itemCount: length,
                            itemBuilder: ((context, index) {
                              if (snapshot.data != null) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: Get.height * .2 + 110,
                                    width: Get.width * 1,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.grey[200],
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(height: 20),
                                        Text(
                                          name.elementAt(index) == null
                                              ? "N/A"
                                              : name.elementAt(index),
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Container(
                                            height: 100,
                                            child: Image.network(
                                              img.elementAt(index) == null
                                                  ? "https://th.bing.com/th/id/OIP.AC9frN1qFnn-I2JCycN8fwHaEK?pid=ImgDet&rs=1"
                                                  : img.elementAt(index),
                                              //"https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-674010.jpg&fm=jpg"),
                                            )),
                                        SizedBox(height: 7),
                                        Text(
                                          'From ${DateFormat('dd-MM-yyyy').format(DateTime.parse(start.elementAt(index)))}   to  ${DateFormat('dd-MM-yyyy').format(DateTime.parse(end.elementAt(index)))}',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            TextButton.icon(
                                              label: Text("Edit"),
                                              onPressed: () {
                                                Get.to(
                                                    editscreen(id: id[index]));
                                              },
                                              icon: Icon(Icons.edit),
                                            ),
                                            GestureDetector(
                                              child: TextButton.icon(
                                                label: Text("Delete"),
                                                onPressed: () async {
                                                  print("deleting contests");
                                                  await APIService
                                                          .deleteContest(
                                                              id[index])
                                                      .whenComplete(() async {
                                                    Get.forceAppUpdate();

                                                    Get.to(homescreen());
                                                    setState(() {
                                                      length = id
                                                          .toSet()
                                                          .toList()
                                                          .length;
                                                    });
                                                    // Get.to(home());

                                                    // return showDialog(
                                                    //     context: context,
                                                    //     builder: (BuildContext
                                                    //         context) {
                                                    //       return AlertDialog(
                                                    //         title: Center(
                                                    //             child: Text(
                                                    //                 "Deleted ")),
                                                    //       );
                                                    //     });
                                                  });
                                                  // id.length;
                                                },
                                                icon: Icon(Icons.delete),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              } else {
                                return CircularProgressIndicator();
                              }
                            })));
                  },
                ),
                // child: FutureBuilder(future: , builder: (context) {
                //   return ListView.builder(
                //     itemBuilder: (context, index) {},
                // children: ele.map((e) {
                //   return Padding(
                //     padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                //     child: Container(
                //       height: Get.height * .2,
                //       width: Get.width * 1,
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(12),
                //         color: Colors.grey[200],
                //       ),
                //       child: Column(
                //         children: [
                //           SizedBox(height: 20),
                //           Text(
                //             "XYZ events",
                //             style: TextStyle(
                //               fontSize: 16,
                //               fontWeight: FontWeight.w700,
                //             ),
                //           ),
                //           SizedBox(height: 20),
                //           Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //             children: [
                //               TextButton.icon(
                //                 label: Text("Edit"),
                //                 onPressed: () {},
                //                 icon: Icon(Icons.edit),
                //               ),
                //               TextButton.icon(
                //                 label: Text("Delete"),
                //                 onPressed: () {},
                //                 icon: Icon(Icons.delete),
                //               )
                //             ],
                //           )
                //         ],
                //       ),
                //     ),
                //   );
                //     // }).toList(),
                //   );
                // }),
              )
            ],
          ),
        ),
      )),
    );
  }
}
