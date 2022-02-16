import 'package:flutter_test/flutter_test.dart';

import 'package:io_graph/io_graph.dart';

void main() {
  test('adds one to input values', () {
    final calculator = Calculator();
    expect(calculator.addOne(2), 3);
    expect(calculator.addOne(-7), -6);
    expect(calculator.addOne(0), 1);
  });

  test('construct graph', () {});
}
