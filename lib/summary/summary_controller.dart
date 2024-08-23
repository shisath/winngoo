import 'package:get/get.dart';

import '../common_file/functions.dart';
import '../common_file/getXcontroller.dart';
import 'model/eventData.dart';
import 'model/priceData.dart';

class SummaryController extends GetxController {
  RxBool loader = false.obs;

  var eventApiData = EventData().obs;
  var priceApiData = PriceData().obs;

  eventApi() async {
    var res = await getMethod(
        endPoint: 'events/${addEventController.selectedId.value}',
        setLoader: (l) {
          loader.value = l;
        },
        success: (s) {});
    if (res.toString().isNotEmpty) {
      eventApiData.value = eventData(res);

      print("sk donr ${eventApiData.value.data!.name}");
    }
  }

  priceApi() async {
    print('sk runniung');
    var res = await getMethod(
        endPoint: 'prices/${chooseYourPlaneController.selectedPlane.value}',
        setLoader: (l) {
          loader.value = l;
        },
        success: (s) {
          if (s == true) {
            Get.toNamed("/summary");
          }
        });
    if (res.toString().isNotEmpty) {
      print('sk sds');

      priceApiData.value = priceData(res);

      print("sk donrs ${priceApiData.value.data!.minQuantity}");
    }
  }
}
