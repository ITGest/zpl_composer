import 'package:zpl_composer/src/composer.dart';

class Font implements ZplComposer {
  int size;
  String family;

  ZplComposer child;

  int x;
  int y;

  Font({
    this.size = 23,
    this.family = 'A',
    this.child,
    this.x,
    this.y,
  });

  @override
  Future<String> build([ZplComposer parent]) async {
    String _content = '';

    if (child != null) {
      _content += await child.build();
    }

    return '^CF$family,$size$_content';
  }

  @override
  ZplComposer fromString(String zplString) {
    throw UnimplementedError();
  }
}
