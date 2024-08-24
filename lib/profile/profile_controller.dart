import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:winggoo/common_file/functions.dart';

class ProfileController extends GetxController {
  GetStorage localStorage = GetStorage();
  TextEditingController signInMailController = TextEditingController();
  TextEditingController signInPasswordController = TextEditingController();
  var selectedMedia = Rxn<XFile>();

  final ImagePicker _imagePicker = ImagePicker();

  Future<void> galleryPicker() async {
    XFile? result = await _imagePicker.pickImage(source: ImageSource.gallery);

    if (result != null && result.toString().isNotEmpty) {
      selectedMedia.value = result;
    }
  }

  Future<void> cameraPicker() async {
    XFile? result = await _imagePicker.pickImage(source: ImageSource.camera);

    if (result != null && result.toString().isNotEmpty) {
      selectedMedia.value = result;
    }
  }

  RxBool obsecure = true.obs;

  RxBool rememberMe = false.obs;

  final mailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  logOut() async {
    final String? token = localStorage.read('api_token');

    var a = await postMethod(
      endPoint: "logout",
      token: token,
      setLoader: (s) {},
      body: {},
      success: (s) {
        if (s == true) {
          localStorage.remove('api_token');
          localStorage.remove('selectedEventId');
          localStorage.remove('selectedPlaneId');
          Get.offNamed("/signIn");
          // Get.reload();
        }
      },
    );

    if (a.toString().isNotEmpty) {}
  }

// postProfile() async {
//   final String? token = localStorage.read('api_token');
//
//   var headers = {
//     'Authorization':
//         'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5Y2QxOTlhNC05NjNhLTQ1ZmYtYjliMi0yNmVkNTU5OTMwODgiLCJqdGkiOiJmNTgyMjk1OWEzOTZmOGY2YzhhM2ZhY2Q2MGU3MWM1NjM5ODA2Mjg2ODVmNmM4MGRlODgzYmNkZDJlNzdiZDYwMDk2OGVlMTllM2ZhOTFhMSIsImlhdCI6MTcyNDQyMjEwNC43NzI0NzQsIm5iZiI6MTcyNDQyMjEwNC43NzI0NzUsImV4cCI6MTc1NTk1ODEwNC43NzAxMzQsInN1YiI6IjQiLCJzY29wZXMiOltdfQ.NCl8F-bzwnf4SuNVkqxJQCLOJZjTf-nU5RSreKHdttMq1asYh5bi2ZWzeZvR2KCxplW2kWcaQFnu3Qst6i62r17STMVWJOHr_oOuu0r4NErjtfdyYvFQItR_O-8yDdZ01k4zk5y8f2ex9N7FdCwo5pDq6w8zZbelhpBFkOEEs_W_bQwADF8dCxzt4t97ffIAwR00Vkml-D575QlXsWvFFdWlZcZrNtgv0xa1XriUThK5WU9iaiBPtZ-KjC41N6TwUdlEFfcWdBLVtrRcRF1Toq7g9hwtm172zNexWVN_7mRylKVPagC71cdyYmhUmLIKzxZe2b3XwF6pK9AAJidPAko9otY836M87vCAPAB130wrK5QvrQA1EM-Ed9AVy1-QUTyNeNS__D1zcSlWsnZazViWkejU-eUVN8MnhHE82cefIsbD4XotKbBHMUCpA6xXIiLqqiJQiIypoW-byWUMyVn6cO7uvdvSMLuNBe0nCPH-hgwbAg63LV5huracNSVvOtG4BB7Z54RlS0uXYdP4R-Xtaal0200e37QhpGYUFx9iw3wX2Vfj96mWuiKh8BsxN-9OToB1w1pVn1R1av5TtosTOkideBbzg9ioqt6qMO8wb8gJucmPP3hD5giHElu8Whv2Gp-kd20Ac_rOI05sgvrWY_12JMZ8ElriXxil5DQ',
//     'Cookie':
//         'XSRF-TOKEN=eyJpdiI6ImQrVWd3REQ5d3FVdWMzc3FNUkxybWc9PSIsInZhbHVlIjoicVRVVEZnOHdnR1U2OWJjN25mM2RBWE5LVWZvWnBHMklDT1RrTTROZ1FoZmZpN3pGWHdtQldVdkVWL1czM1k2M2hBdG56RzZUU1Q1a01Qb3VTNWlwRDdvbjFLcjZEcVF1MElXQVVMZnNFTW5vTitWaUFkUnE4YlB0em9LS0FDYkoiLCJtYWMiOiI5ZmE4NDZhNDQ3YWJlMTJjZTg1MmIxNjc5M2E5ZTM2ZDA3NzQyMmYwZDk5MGU5YTcxNjliZThmODQyYjZkZjQxIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IlFwMkJmUDlCcG5nZ0llNWZBa2pySXc9PSIsInZhbHVlIjoiZGY0ck14TytuTEU2VmtqMFB4UGFEWlVaVVBCazJsQW5sOEljVjRIWXBrTHh2UzU0Y3Y2UUxCNTN5OHBvWVdxSU9CMkZXaXVRYVZlOHdBU3EzdnBDUVMwN01RcUZFVHBWUktHWVMzMXhIYnd4S3FzU2JkWFBGNm9IZjFsMTJ2S0UiLCJtYWMiOiJiMWVkMTkzZjE5ZjkwMDhkYjEwNmZkYjUxNzM2MjhjOWU1NDlhNjNjM2Q5ZjFlNTRiZmNhNmZmYjE0NmVhN2NkIiwidGFnIjoiIn0%3D'
//   };
//   var request = http.MultipartRequest(
//       'POST',
//       Uri.parse(
//           'https://winngoogala.winngooconsultancy.in/api/profile-photo'));
//   request.files.add(await http.MultipartFile.fromPath('photo',
//       '/C:/Users/Dhasan KD/OneDrive/Pictures/Screenshot 2023-10-13 1231354.png'));
//   request.headers.addAll(headers);
//
//   http.StreamedResponse response = await request.send();
//
//   if (response.statusCode == 200) {
//     print(await response.stream.bytesToString());
//   } else {
//     print(response.reasonPhrase);
//   }
// }
}
