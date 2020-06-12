import 'package:zpl_composer/src/composer.dart';

class Column implements ZplComposer {
  int x;
  int y;
  List<ZplComposer> children;

  String _zplString = '';

  Column({
    this.x,
    this.y,
    this.children,
  });

  @override
  ZplComposer build([ZplComposer parent]) {
    _zplString += children.map((e) => e.getString()).toString();

    return this;
  }

  @override
  ZplComposer fromString(String zplString) {
    throw UnimplementedError();
  }

  @override
  String getString() {
    return _zplString;
  }
}
