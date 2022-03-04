import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class storyscreen extends StatelessWidget {
  List ele = [1, 2, 34, 4, 5, 6, 7, 8, 9, 8, 7, 6];

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Add Story'),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(24),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  height: Get.height * .12,
                  width: Get.width * .5,
                  decoration: BoxDecoration(
                      color: Colors.blue.shade200,
                      border: Border.all(color: Colors.blueAccent.shade700)),
                  child: Center(
                    child: Text("Click the button to add new stories"),
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            OutlinedButton(
              child: Text("Update"),
              onPressed: () {},
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
              child: CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 0.7,
                  height: 400.0,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                ),
                items: [1, 2, 3, 4, 5, 2, 4, 67, 7, 8, 9, 9].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(color: Colors.white),
                          child: Column(
                            children: [
                              Container(
                                height: Get.height * .4,
                                width: Get.width * 1 - 100,
                                child: Image.network(
                                  "https://i.pinimg.com/originals/58/bd/4f/58bd4fc9ebfccc1f2de419529bbf1a12.jpg",
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Icon(
                                        Icons.remove_red_eye,
                                        color: Colors.blue,
                                      ),
                                      Text("125")
                                    ],
                                  ),
                                  Icon(
                                    Icons.delete,
                                    color: Colors.blue,
                                  ),
                                ],
                              )
                            ],
                          ));
                    },
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
