// dart code file
import 'package:event/event.dart';

int mode = 0;
Landscape dataGrid = Landscape(20);

var dataUpdate = Event();

class Landscape {
  int size;
  late List<List<int>> values;

  Landscape(this.size) {
    values = List.filled(size, List.filled(size, 0));
  }
}
