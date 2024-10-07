# ตัวอย่างการเขียน unit test

การเขียน Unit Test ใน Flutter ด้วย Mocktail จะช่วยในการทดสอบแยกส่วนโดยการสร้าง mock ของ dependencies ที่ class นั้น ๆ ต้องพึ่งพา ทำให้คุณสามารถทดสอบ logic ได้โดยไม่ต้องพึ่งพาระบบภายนอกจริง ๆ เช่น การเชื่อมต่อเครือข่ายหรือฐานข้อมูล


#### 1. สร้าง Mock Class
เราจะใช้ mocktail เพื่อ mock dependencies ของ class ที่เราต้องการทดสอบ

```
import 'package:mocktail/mocktail.dart';

// สมมุติว่ามี Repository ที่เราจะ mock
class UserRepository {
  Future<String> fetchUserName() async {
    // ฟังก์ชันดึงข้อมูลจากแหล่งภายนอก
    return "Real User";
  }
}

// การสร้าง mock class ด้วย mocktail
class MockUserRepository extends Mock implements UserRepository {}
```

####  2. เขียน Unit Test

```
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'user_repository.dart';  // Import ตัวอย่าง class ที่เราจะทดสอบ

void main() {
  late MockUserRepository mockUserRepository;
  late GetUsernameUseCase usecases;

  // ฟังก์ชัน setup เพื่อเตรียมตัว mock ก่อนทดสอบแต่ละกรณี
  setUp(() {
    mockUserRepository = MockUserRepository();
    usecases = GetUsernameUseCase(mockUserRepository);
  });

  // การทดสอบว่า fetchUserName return ค่า "Mocked User"
  test('fetchUserName returns "Mocked User"', () async {
    // การกำหนดพฤติกรรมของ mock
    when(() => mockUserRepository.fetchUserName())
        .thenAnswer((_) async => 'Mocked User');

    // เรียกใช้ฟังก์ชันที่ต้องการทดสอบ
    final userName =  await usecases.call();

    // ตรวจสอบผลลัพธ์
    expect(userName, 'Mocked User');

  });
}
```

####  3. เขียน Unit Test แบบ Group test

```
import 'package:test/test.dart';

int add(int a, int b) => a + b;

void main() {
  group('Add function', () {
    test('should return the sum of two numbers', () {
      expect(add(1, 2), equals(3));
    });

    test('should return the sum of negative numbers', () {
      expect(add(-1, -2), equals(-3));
    });
  });
}
```

- group เป็นการจัดกลุ่มการทดสอบที่เกี่ยวข้องกัน
- test คือการทดสอบแต่ละเคส
- expect คือการตรวจสอบค่าที่ต้องการเทียบกับค่าที่ได้จากการทำงานของฟังก์ชัน

#### สรุป
- สร้าง class ที่ต้องการทดสอบ
- สร้าง mock class โดยใช้ Mocktail
- เขียน Unit Test โดยการกำหนดพฤติกรรมของ mock และตรวจสอบผลลัพธ์





