import 'dart:convert';

import 'package:chat_app_admin/models/competitions.dart';
import 'package:http/http.dart' as http;

class APIService {
  APIService._();
  static const String API_HOST = 'https://socio-club-app.herokuapp.com/';
  static http.Client client = http.Client();
  static String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiYW50byIsImVtYWlsIjoiYW50b3RvbWFicmFoYW1AZ21haWwuY29tIiwiaWQiOiI2MjM1YjQwY2RhZjA5ZTA5OTlkNjhlY2MiLCJwaG90b3VybCI6Imh0dHBzOi8vdHNlMi5tbS5iaW5nLm5ldC90aD9pZD1PSVAuNlZySTFmZTdCWEJUX2ROUGczQkJYUUhhRW8mcGlkPUFwaSZQPTAmdz0yOTQmaD0xODQiLCJ1c2VybmFtZSI6ImFudG80NSIsInBob25lIjoiMzkzOTM5MzkzOSIsImlhdCI6MTY0Nzc1NDYzMCwiZXhwIjoxNjUwMzQ2NjMwfQ.EDzGwY-eqO2-uQ3dcr-x2m4iP0mFAo1_K_64a11typg";
  static Map<String, String> getAuthHeaderForGet() {
    return {'x-access-token': token};
  }

  static Map<String, String> getAuthHeaderForPost() {
    // String token = userInfo.get('token')!;
    // if (token == null) throw new Exception('User is not logged in');
    return {
      'x-access-token': token,
      'Content-Type': 'application/json; charset=UTF-8'
    };
    // }
  }

  static Future<bool> createCompetition(String start, String end, String topic,
      String desc, String image, String limit) async {
    print("enterd into create Team");
    //print(logo + "/" + name + "/" + strength.toString() + "/" + level);
    var resp = await client.post(
      Uri.parse(API_HOST + 'admin/newComp'),
      headers: getAuthHeaderForPost(),
      body: jsonEncode(
        <String, dynamic>{
          "startDate": start,
          "endDate": end,
          "topic": topic,
          "description": desc,
          "image": image,
          "limit": limit,
        },
      ),
    );
    print(resp.statusCode);
    if (resp.statusCode == 201) {
      print(resp.body + "this is res.body");
      return true;
    } else if (resp.statusCode == 401) {
      print(resp.body + "this is res.body");
      print("error is there");
      return false;
    } else {
      print(resp.body);
    }
    jsonDecode(resp.body);
    //print("some error else");
    //error.call('Something is Wrong with the Server');
    return false;
  }

  static Future<competitions?> getCompetition() async {
    print("fetchTeamMembers API");
    var header = getAuthHeaderForGet();
    var resp = await client.get(
      Uri.parse(API_HOST + 'admin/competitionsByDate'),
      headers: header,
    );
    print(resp.statusCode);
    print(json.decode(resp.body));
    if (resp.statusCode == 200) {
      print("not null");
      return competitions.fromJson(json.decode(resp.body));
    } else {
      print("into null");
      return null;
    }
  }

  static Future<bool> deleteContest(String id) async {
    print("called api");
    var resp = await client.delete(
      Uri.parse(API_HOST + 'admin/delete/$id'),
      headers: getAuthHeaderForPost(),
    );
    print(resp.statusCode);
    if (resp.statusCode == 201) {
      print(resp.body + "this is res.body");
      return true;
    } else if (resp.statusCode == 401) {
      print(resp.body + "this is res.body");
      print("error is there");
      return false;
    } else {
      print(resp.body);
    }
    jsonDecode(resp.body);
    //print("some error else");
    //error.call('Something is Wrong with the Server');
    return false;
  }

  static Future<bool> editCompetition(
      String status, String end, String desc, String id) async {
    print("enterd into create Team");
    //print(logo + "/" + name + "/" + strength.toString() + "/" + level);
    var resp = await client.patch(
      Uri.parse(API_HOST + 'admin/editComp'),
      headers: getAuthHeaderForPost(),
      body: jsonEncode(
        <String, dynamic>{
          "competitionId": id,
          "endDate": end,
          "description": desc,
          "status": status,
        },
      ),
    );
    print(resp.statusCode);
    if (resp.statusCode == 200) {
      print(resp.body + "this is res.body");
      return true;
    } else if (resp.statusCode == 401) {
      print(resp.body + "this is res.body");
      print("error is there");
      return false;
    } else {
      print(resp.body);
    }
    jsonDecode(resp.body);
    //print("some error else");
    //error.call('Something is Wrong with the Server');
    return false;
  }

  static Future<bool> postStory(String story) async {
    print("enterd into create Team");
    //print(logo + "/" + name + "/" + strength.toString() + "/" + level);
    var resp = await client.post(
      Uri.parse(API_HOST + 'admin/newStory'),
      headers: getAuthHeaderForPost(),
      body: jsonEncode(
        <String, dynamic>{
          "story": story,
        },
      ),
    );
    print(resp.statusCode);
    if (resp.statusCode == 201) {
      print(resp.body + "this is res.body");
      return true;
    } else if (resp.statusCode == 401) {
      print(resp.body + "this is res.body");
      print("error is there");
      return false;
    } else {
      print(resp.body);
    }
    jsonDecode(resp.body);
    //print("some error else");
    //error.call('Something is Wrong with the Server');
    return false;
  }

  static Future<competitions?> getstories() async {
    print("fetchTeamMembers API");
    var header = getAuthHeaderForGet();
    var resp = await client.get(
      Uri.parse(API_HOST + 'admin/competitionsByDate'),
      headers: header,
    );
    print(resp.statusCode);
    print(json.decode(resp.body));
    if (resp.statusCode == 200) {
      print("not null");
      return competitions.fromJson(json.decode(resp.body));
    } else {
      print("into null");
      return null;
    }
  }

  static Future<bool> deleteStories(String id) async {
    print("called api");
    var resp = await client.delete(
      Uri.parse(API_HOST + 'stories/delete/$id'),
      headers: getAuthHeaderForPost(),
    );
    print(resp.statusCode);
    if (resp.statusCode == 200) {
      print(resp.body + "this is res.body");
      return true;
    } else if (resp.statusCode == 401) {
      print(resp.body + "this is res.body");
      print("error is there");
      return false;
    } else {
      print(resp.body);
    }
    jsonDecode(resp.body);
    //print("some error else");
    //error.call('Something is Wrong with the Server');
    return false;
  }
}
