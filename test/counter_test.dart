import 'package:andreaproject/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  //before test
  //setup/teardown -> is called before every test
  //setup all/teardown all -> is called before all the test

  // setUp(() {});
  // setUpAll(() {});

  //given when then
  late Counter counter;

  setUp(() {
    counter = Counter();
  });

  group('Counter Class', () {
    test(
      'given counter class when its instantiated then value of count should zero',
      () {
        //Act - When
        final val = counter.count;
        //Assert - Then
        expect(val, 0);
      },
    );

    test('given counter when its increment then the value should be 1', () {
      //When
      counter.incrementCounter();
      final val = counter.count;

      //Then
      expect(val, 1);
    });

    test('given counter when its decrement then the value should be -1', () {
      counter.decrementCounter();
      final val = counter.count;

      expect(val, -1);
    });

    test('given counter when its reset then the value should be 0', () {
      counter.reset();
      final val = counter.count;

      expect(val, 0);
    });
  });

  //Post test
  // tearDown(() {});
  // tearDownAll(() {});
}
