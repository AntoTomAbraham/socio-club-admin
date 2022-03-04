import 'package:flutter/material.dart';
import 'package:get/get.dart';

class contests extends StatelessWidget {
  List ele = [1, 2, 3, 4, 5, 6, 7, 8, 9, 8, 7, 6];

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
                child: ListView(
                  children: ele.map((e) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Container(
                        height: Get.height * .2,
                        width: Get.width * 1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey[200],
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 20),
                            Text(
                              "XYZ events",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton.icon(
                                  label: Text("Edit"),
                                  onPressed: () {},
                                  icon: Icon(Icons.edit),
                                ),
                                TextButton.icon(
                                  label: Text("Delete"),
                                  onPressed: () {},
                                  icon: Icon(Icons.delete),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
