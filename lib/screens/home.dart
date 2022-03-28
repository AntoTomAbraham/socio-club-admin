// ignore_for_file: avoid_print

import 'package:chat_app_admin/screens/apiControl.dart';
import 'package:chat_app_admin/services/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

TextEditingController topicController = TextEditingController();
TextEditingController descController = TextEditingController();
TextEditingController imageController = TextEditingController();
TextEditingController limitController = TextEditingController();
TextEditingController startController = TextEditingController();
TextEditingController endController = TextEditingController();
DateTime startDate = DateTime.now();
DateTime endDate = DateTime.now();
final apiControl controller = apiControl();

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 21.0, right: 21),
          child: Container(
            height: Get.height * 1,
            child: Column(
              children: [
                SizedBox(height: 10),
                textt("Enter name of the contest"),
                TextField(
                  decoration: InputDecoration(
                      hintText: 'Name',
                      contentPadding: const EdgeInsets.all(15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                  controller: topicController,
                ),
                textt("Enter Description"),
                TextField(
                  decoration: InputDecoration(
                      hintText: 'Description',
                      contentPadding: const EdgeInsets.all(15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                  controller: descController,
                  // onChanged: (value) {
                  //   // do something
                  // },
                ),
                textt("Paste image link"),
                TextField(
                  decoration: InputDecoration(
                      hintText: 'Image link',
                      contentPadding: const EdgeInsets.all(15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                  controller: imageController,
                  // onChanged: (value) {
                  //   // do something
                  // },
                ),
                textt("Enter participants limit"),
                TextField(
                  decoration: InputDecoration(
                      hintText: 'Limit',
                      contentPadding: const EdgeInsets.all(15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                  controller: limitController,
                  // onChanged: (value) {
                  //   // do something
                  // },
                ),
                textt("Enter Start Date"),
                TextField(
                  decoration: InputDecoration(
                      hintText: 'Start Date',
                      contentPadding: const EdgeInsets.all(15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                  controller: startController,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(
                            2000), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));

                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000

                      setState(() {
                        startDate = pickedDate;
                        startController.text = pickedDate
                            .toString(); //set output date to TextField value.
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
                  // onChanged: (value) {
                  //   // do something
                  // },
                ),
                textt("End Date"),
                TextField(
                  decoration: InputDecoration(
                      hintText: 'End Date',
                      contentPadding: const EdgeInsets.all(15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                  controller: endController,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(
                            2000), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));

                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000

                      setState(() {
                        endDate = pickedDate;
                        endController.text = pickedDate
                            .toString(); //set output date to TextField value.
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
                  // onChanged: (value) {
                  //   // do something
                  // },
                ),
                // textt("Enter Like"),
                // TextField(
                //   decoration: InputDecoration(
                //       hintText: 'Like',
                //       contentPadding: const EdgeInsets.all(15),
                //       border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(30))),
                //   onChanged: (value) {
                //     // do something
                //   },
                // ),
                // Container(
                //   height: 50,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text(
                //         "Upload Pictures",
                //         style: TextStyle(fontSize: 16),
                //       ),
                //       FlatButton(
                //         onPressed: () {},
                //         color: Colors.blue,
                //         child: Text("Upload"),
                //       )
                //     ],
                //   ),
                // ),
                SizedBox(height: 10),
                OutlinedButton(
                  child: Text("Post"),
                  onPressed: () async {
                    var data = await APIService.createCompetition(
                      startDate.toIso8601String(),
                      endDate.toIso8601String(),
                      topicController.text,
                      descController.text,
                      imageController.text,
                      limitController.text,
                    ).then((value) {
                      if (value == true) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Center(child: Text("Successfull")),
                              );
                            });
                        print("True");
                      } else {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Center(child: Text("Failed")),
                              );
                            });
                        print("False");
                      }
                    });
                    //.whenComplete((data) {
                    // if (data == true) {
                    //   print("Successfull");
                    //   // Get.snackbar(
                    //   //     "Successfull", "Competition Posted Successfully");
                    // } else {
                    //   print("failed");
                    //   // Get.snackbar("Failed", "Competition Posting Failed");
                    // }
                  },
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textt(String texte) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
              child: Text(
            texte,
            style: TextStyle(fontSize: 16),
          ))),
    );
  }
}
