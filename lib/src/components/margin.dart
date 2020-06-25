import 'package:zpl_composer/src/composer.dart';

class Margin implements ZplComposer {
  int x;
  int y;
  int top;
  int bottom;

  Margin({
    this.bottom,
    this.top,
    this.x,
    this.y,
  });

  @override
  Future<String> build([ZplComposer parent]) {
    return null;
  }

  @override
  ZplComposer fromString(String zplString) {
    return null;
  }
}
