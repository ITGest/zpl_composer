import 'package:zpl_composer/src/components/flex/align.dart';
import 'package:zpl_composer/src/composer.dart';

class Flex implements ZplComposer {
  final int x;
  final int y;
  final FlexAlign align;
  final ZplComposer child;

  int position;

  Flex({
    this.x,
    this.y,
    this.align,
    this.child,
  });

  @override
  ZplComposer build([ZplComposer parent]) {
    position = align == FlexAlign.left ? x : 201 - 5;

    return this;
  }

  @override
  ZplComposer fromString(String zplString) {
    return this;
  }

  @override
  String getString() {
    build();

    return position.toString();
  }
}
