import 'package:flutter_test/flutter_test.dart';

import 'package:io_graph/io_graph.dart';

void main() {
  test('adds one to input values', () {
    final calculator = Calculator();
    expect(calculator.addOne(2), 3);
    expect(calculator.addOne(-7), -6);
    expect(calculator.addOne(0), 1);
  });

  test('Dikstra', () {
    var a = Node("a", 0, 0);
    var b = Node("b", 0, 0);
    var c = Node("c", 0, 0);
    var d = Node("d", 0, 0);
    var e = Node("e", 0, 0);
    var f = Node("f", 0, 0);
    var g = Node("g", 0, 0);

    a.neighbours.add(Link<String>(1, b));
    a.neighbours.add(Link<String>(2, e));

    b.neighbours.add(Link<String>(2, a));
    b.neighbours.add(Link<String>(3, e));
    b.neighbours.add(Link<String>(1, d));
    b.neighbours.add(Link<String>(2, c));

    c.neighbours.add(Link<String>(2, b));
    c.neighbours.add(Link<String>(1, d));
    c.neighbours.add(Link<String>(2, g));

    d.neighbours.add(Link<String>(1, b));
    d.neighbours.add(Link<String>(2, e));
    d.neighbours.add(Link<String>(1, c));
    d.neighbours.add(Link<String>(4, g));

    e.neighbours.add(Link<String>(1, e));
    e.neighbours.add(Link<String>(3, b));
    e.neighbours.add(Link<String>(2, d));
    e.neighbours.add(Link<String>(3, g));
    e.neighbours.add(Link<String>(4, f));

    f.neighbours.add(Link<String>(4, e));
    f.neighbours.add(Link<String>(2, g));

    g.neighbours.add(Link<String>(2, c));
    g.neighbours.add(Link<String>(4, d));
    g.neighbours.add(Link<String>(3, e));
    g.neighbours.add(Link<String>(2, f));

    var graph = Graph({a, b, c, d, e, f, g}.toList(), b, f);

    var result = graph.dikstra().toString();
    //print(result);
    expect(result, {b, c, g, f}.toList().toString());
  });
}
