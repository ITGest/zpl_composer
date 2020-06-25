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

  test('Test if can build', () async {
    final _text = Text(null);

    expect(() async => await _text.build(), returnsNormally);
    expect(await _text.build() is String, true);
  });

  test('Test if build() returns the ZPL code', () async {
    final _text = Text('Title');

    expect(() async => await _text.build(), returnsNormally);

    final _textText = await _text.build();

    expect(_textText.isNotEmpty, true);
    expect(_textText.contains('^FO'), true);
    expect(_textText.contains('^FD'), true);
    expect(_textText.endsWith('^FS'), true);
  });

  test('Test if build() returns the ZPL code with the required parameters', () async {
    final _text = Text('Title', x: 10, y: 20);

    final _textText = await _text.build();

    expect(_textText.contains('^FO10,20'), true);
    expect(_textText.contains('^FDTitle'), true);
  });
}
