import 'package:zpl_composer/src/composer.dart';

class Page implements ZplComposer {
  String _zplString = '';

  final ZplComposer child;

  Page({
    this.child,
  });

  @override
  ZplComposer build([ZplComposer parent]) {
    final _childZplString = child.getString();

    _zplString = '^XA$_childZplString^XZ';

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
