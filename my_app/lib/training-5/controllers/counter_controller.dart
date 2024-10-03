import 'package:get/get.dart';

class CounterController extends GetxController with StateMixin<List<String>> {
  var count = 0.obs; // ใช้ obs เพื่อสร้างตัวแปรที่ตอบสนองต่อการเปลี่ยนแปลง

  void increment() {
    count++;
  }

  void decrement() {
    count--;
    update();
  }

  void fetchData() {
    change([], status: RxStatus.loading()); // เปลี่ยนสถานะเป็น loading

    // สมมุติว่าโหลดข้อมูลจาก API
    Future.delayed(Duration(seconds: 2), () {
      change(['Data 1', 'Data 2'],
          status: RxStatus.success()); // เปลี่ยนสถานะเป็น success
    });
  }
}
