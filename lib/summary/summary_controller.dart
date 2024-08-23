import 'package:get/get.dart';
import 'package:winggoo/home/home_widget.dart';

import '../common_file/functions.dart';
import 'model/eventData.dart';

class SummaryController extends GetxController {
  RxBool loader = false.obs;

  var eventApiData = EventData().obs;

  eventApi() async {
    var res = await getMethod(
        endPoint: 'events/${addEventController.selectedId.value}',
        setLoader: (l) {
          loader.value = l;
        });
    if (res.toString().isNotEmpty) {
      eventApiData.value = eventData(res);

      print("sk donr ${eventApiData.value.data!.name}");
    }
  }
}
