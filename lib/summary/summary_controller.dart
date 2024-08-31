import 'package:get/get.dart';

import '../common_file/functions.dart';
import '../common_file/getXcontroller.dart';
import 'model/eventData.dart';
import 'model/priceData.dart';

class SummaryController extends GetxController {
  RxBool loader = false.obs;

  var eventApiData = EventData().obs;
  var priceApiData = PriceData().obs;
  RxBool eventResponseLoader = false.obs;
  RxBool priceResponseLoader = false.obs;

  eventApi() async {
    print('summary event Api running');
    final String? eventId = localStorage.read('selectedEventId');
    print('eventId $eventId');
    print('eventApi running ${addEventController.selectedId.value}');
    var res = await getMethod(
        endPoint: 'events/$eventId',
        setLoader: (l) {
          loader.value = l;
        },
        success: (s) {
          if (s == true) {
            print('pricing Api');
            eventResponseLoader.value = s;
          }
        });
    if (res.toString().isNotEmpty && eventResponseLoader.value == true) {
      print('event api summary ${res}');
      eventApiData.value = eventData(res);
      summaryController.priceApi();
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
            print(' moved sk');
            priceResponseLoader.value = s;
          }
        });
    if (res.toString().isNotEmpty && priceResponseLoader.value == true) {
      print('sk sds');

      priceApiData.value = priceData(res);
      paymentController.totalAmount.value =
          priceApiData.value.data!.priceWithVat.toString();
      print('navigated to summary');
      Get.toNamed("/summary");
    }
  }
}
