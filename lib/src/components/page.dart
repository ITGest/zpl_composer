import 'package:zpl_composer/src/components/font.dart';
import 'package:zpl_composer/src/composer.dart';

class Page implements ZplComposer {
  final int width;
  final ZplComposer child;

  Page({
    this.width,
    this.child,
  });

  @override
  Future<String> build([ZplComposer parent]) async {
    String _content = '';

    if (!(child is Font)) {
      _content += await Font().build();
    }

    _content += await child.build();

    return '^XA$_content^XZ';
  }

  @override
  ZplComposer fromString(String zplString) {
    return this;
  }
}
