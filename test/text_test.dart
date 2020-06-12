import 'package:flutter_test/flutter_test.dart';
import 'package:zpl_composer/src/composer.dart';

import '../lib/src/components/text.dart';

void main() {
  test('Test if Text is instantiable', () {
    expect(() => Text(null), returnsNormally);
  });

  test('Test if Text is instantiable instance of ZplComposer', () {
    expect(Text(null) is ZplComposer, true);
  });

  test('Test all properties are passed on instantiation', () {
    final _text = Text(
      'Title',
    );

    expect(_text.text, 'Title');
  });

  test('Test if can build', () {
    final _text = Text(null);

    expect(() => _text.build(), returnsNormally);
    expect(_text.build() is ZplComposer, true);
  });

  test('Test if getString() returns the ZPL code', () {
    final _text = Text('Title');

    expect(() => _text.getString(), returnsNormally);

    final _textText = _text.getString();

    expect(_textText.isNotEmpty, true);
    expect(_textText.contains('^FO'), true);
    expect(_textText.contains('^FD'), true);
    expect(_textText.endsWith('^FS'), true);
  });

  test('Test if getString() returns the ZPL code with the required parameters',
      () {
    final _text = Text('Title', x: 10, y: 20);

    final _textText = _text.getString();

    expect(_textText.contains('^FO10,20'), true);
    expect(_textText.contains('^FDTitle'), true);
  });
}
