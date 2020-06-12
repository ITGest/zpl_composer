import 'package:zpl_composer/src/composer.dart';

class Font implements ZplComposer {
  int size;
  String family;
  ZplComposer child;

  String _zplString = '';

  Font({
    this.size = 23,
    this.family = 'A',
    this.child,
  });

  @override
  ZplComposer build([ZplComposer parent]) {
    String _content = '';

    if (child != null) {
      _content = child.getString();
    }

    _zplString = '^CF$family,$size$_content';

    return this;
  }

  @override
  ZplComposer fromString(String zplString) {
    throw UnimplementedError();
  }

  @override
  String getString() {
    build();

    return _zplString;
  }
}
