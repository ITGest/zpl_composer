import 'package:zpl_composer/src/components/font.dart';
import 'package:zpl_composer/src/composer.dart';

class Page implements ZplComposer {
  final int width;
  final ZplComposer child;

  String _zplString = '';

  Page({
    this.width,
    this.child,
  });

  @override
  ZplComposer build([ZplComposer parent]) {
    String _content = '';

    if (!(child is Font)) {
      _content = Font().getString();
    }

    _content += child.getString();

    _zplString = '^XA$_content^XZ';

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
