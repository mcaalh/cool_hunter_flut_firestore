import 'package:get/get.dart';

class AppController extends GetxController {
  static AppController instance = Get.find();
  // Rx<Widget> activeDraggableWidget = Rx<Widget>(DevicesDraggable());
  // Rx<DeviceModel> activeDevie = DeviceModel().obs;
  RxBool isLoginWidgetDisplayed = true.obs;

  void changeDisplayedAuthWidget() {
    isLoginWidgetDisplayed.value = !isLoginWidgetDisplayed.value;
  }

  // void changeActiveDeviceTo(DeviceModel device) {
  //   activeDevie.value = device;
  // }

  // void changeActiveDraggableWidgetTo(Widget widget) {
  //   activeDraggableWidget.value = widget;
  // }
}
