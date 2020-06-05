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
      fontSize: 25,
      isBold: true,
    );

    expect(_text.text, 'Title');
    expect(_text.fontSize, 25);
    expect(_text.isBold, true);
  });

  test(
      'Test if fontSize defaults to 23 if no fontSize is specified on instantiation',
      () {
    final _text = Text(null);

    expect(_text.fontSize, 23);
  });

  test(
      'Test is isBold defaults to false if nothings is specified on instantiation',
      () {
    final _text = Text(null);

    expect(_text.isBold, false);
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
    expect(_textText.startsWith('^CF'), true);
    expect(_textText.contains('^FO'), true);
    expect(_textText.contains('^FD'), true);
    expect(_textText.endsWith('^FS'), true);
  });

  test('Test if getString() returns the ZPL code with the required parameters',
      () {
    final _text = Text(
      'Title',
      fontSize: 25,
      isBold: true,
    );

    _text.x = 10;
    _text.y = 20;

    final _textText = _text.getString();

    expect(_textText.contains('^CFA,25'), true);
    expect(_textText.contains('^FO10,20'), true);
    expect(_textText.contains('^FDTitle'), true);
  });
}
