library zpl_composer;

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

  /// Builds this ZPL composer instance
  /// [ZplComposer parent] represents the parent
  /// component that requested this instance to build
  @override
  ZplComposer build([ZplComposer parent]) {
    final bold = isBold ? 'A' : '0';

    _zplString = '^CF$bold,$fontSize^FO$x,$y^FD$text^FS';

    return this;
  }

  /// Makes a new instance based on [zplString]
  ///
  /// [zplString] the String that will be used
  /// to build this instance
  @override
  ZplComposer fromString(String zplString) {
    return this;
  }

  /// Gets the ZPL code as String
  @override
  String toString() {
    build();

    return _zplString;
  }
}
