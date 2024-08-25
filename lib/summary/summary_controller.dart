import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../common_file/functions.dart';
import '../common_file/getXcontroller.dart';
import 'model/eventData.dart';
import 'model/priceData.dart';

class SummaryController extends GetxController {
  RxBool loader = false.obs;

  var eventApiData = EventData().obs;
  var priceApiData = PriceData().obs;

  eventApi() async {
    print('summary event Api running');
    final String? eventId = localStorage.read('selectedEventId');
    print('eventApi running ${addEventController.selectedId.value}');
    var res = await getMethod(
        endPoint: 'events/$eventId',
        setLoader: (l) {
          loader.value = l;
        },
        success: (s) {
          if (s == true) {
            print('pricing Api');
            summaryController.priceApi();
          }
        });
    if (res.toString().isNotEmpty) {
      eventApiData.value = eventData(res);
    }
  }

  priceApi() async {
    print('summary price');
    final String? selectedPlane = localStorage.read('selectedPlaneId');
    var res = await getMethod(
        endPoint: 'prices/$selectedPlane',
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
      paymentController.totalAmount.value =
          priceApiData.value.data!.priceWithVat.toString();
    }
  }
}
