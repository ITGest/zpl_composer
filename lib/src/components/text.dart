import 'package:zpl_composer/src/composer.dart';

class Text implements ZplComposer {
  String text;
  int fontSize;
  bool isBold;

  int y;
  int x;

  String _zplString = '';

  Text(
    this.text, {
    this.fontSize = 23,
    this.isBold = false,
  });

  @override
  ZplComposer build() {
    final bold = isBold ? 'A' : '0';

    _zplString = '^CF$bold,$fontSize^FO$x,$y^FD$text^FS';

    return this;
  }

  @override
  ZplComposer fromString(String zplString) {
    return this;
  }

  @override
  String toString() {
    build();

    return _zplString;
  }
}
