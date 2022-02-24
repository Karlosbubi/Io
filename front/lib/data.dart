int mode = 0;
Landscape dataGrid = Landscape(20);

class Landscape {
  final int size;
  late List<List<int>> values;

  Landscape(this.size) {
    values = List.filled(size, List.filled(size, 0));
  }
}
