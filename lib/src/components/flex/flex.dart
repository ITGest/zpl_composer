import 'package:zpl_composer/src/components/flex/align.dart';
import 'package:zpl_composer/src/composer.dart';

class Flex implements ZplComposer {
  final FlexAlign align;

  int position;

  Flex({this.align});

  @override
  ZplComposer build([ZplComposer parent]) {
    position = align == FlexAlign.left ? 50 : 260;

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
