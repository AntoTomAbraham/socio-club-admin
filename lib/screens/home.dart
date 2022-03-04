import 'package:flutter/material.dart';
import 'package:get/get.dart';

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

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
                  onChanged: (value) {
                    // do something
                  },
                ),
                textt("Enter Domain"),
                TextField(
                  decoration: InputDecoration(
                      hintText: 'Domain',
                      contentPadding: const EdgeInsets.all(15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                  onChanged: (value) {
                    // do something
                  },
                ),
                textt("Enter participants limit"),
                TextField(
                  decoration: InputDecoration(
                      hintText: 'Participants Limit',
                      contentPadding: const EdgeInsets.all(15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                  onChanged: (value) {
                    // do something
                  },
                ),
                textt("Enter Description"),
                TextField(
                  decoration: InputDecoration(
                      hintText: 'Description',
                      contentPadding: const EdgeInsets.all(15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                  onChanged: (value) {
                    // do something
                  },
                ),
                textt("Enter Like"),
                TextField(
                  decoration: InputDecoration(
                      hintText: 'Like',
                      contentPadding: const EdgeInsets.all(15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                  onChanged: (value) {
                    // do something
                  },
                ),
                Container(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Upload Pictures",
                        style: TextStyle(fontSize: 16),
                      ),
                      FlatButton(
                        onPressed: () {},
                        color: Colors.blue,
                        child: Text("Upload"),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10),
                OutlinedButton(
                  child: Text("Post"),
                  onPressed: () {},
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
