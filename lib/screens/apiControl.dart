import 'package:chat_app_admin/models/competitions.dart';
import 'package:chat_app_admin/services/api.dart';
import 'package:get/get.dart';

class apiControl extends GetxController {
  var createcompetion = "";
  var createCompetitonLoading = true.obs;

  Future<dynamic> postCompetition(
      String start, String end, String topic, String desc) async {
    // createcompetion =
    //     await APIService.createCompetition(start, end, topic, desc).toString();
    createCompetitonLoading.value = false;
    if (createcompetion == true) {
      return true;
    } else {
      return false;
    }
  }

  var name = <String>[].obs;
  var state = <String>[].obs;
  var city = <String>[].obs;
  var isLoading = true.obs;
  //Rx<competition> comp = competition(comp: []).obs;
  getCompetitons() async {
    print("entered into nearbyVenues");
    var dataModel = await APIService.getCompetition();
    // venues(dataModel);
    // createVenues();
    // isLoading(false);
  }
}
