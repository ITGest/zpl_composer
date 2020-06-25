import 'package:zpl_composer/src/composer.dart';

class Text implements ZplComposer {
  String text;

  int y;
  int x;

  Text(
    this.text, {
    this.x,
    this.y,
  });

  /// Builds this ZPL composer instance
  /// [ZplComposer parent] represents the parent
  /// component that requested this instance to build
  @override
  build([ZplComposer parent]) async {
    return '^FO$x,$y^FD$text^FS';
  }

  /// Makes a new instance based on [zplString]
  ///
  /// [zplString] the String that will be used
  /// to build this instance
  @override
  ZplComposer fromString(String zplString) {
    return this;
  }
}
