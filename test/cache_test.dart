import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  setUp(() {
    Hive.init('database');
  });

  test('Name Box Create and Put', () async {
    final box = await Hive.openBox<String>('sky');
    await box.add('veli');
    expect(box.values.first, 'veli');
  });
}
