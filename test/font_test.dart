import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:zpl_composer/src/components/font.dart';
import 'package:zpl_composer/src/composer.dart';

class ZplComposerMock extends Mock implements ZplComposer {}

void main() {
  test('Font is instantiable', () {
    expect(() => Font(), returnsNormally);
  });

  test(
      'Test if size defaults to 23 if no fontSize is specified on instantiation',
      () {
    final _font = Font();

    expect(_font.size, 23);
  });

  test('Test if size properties are being set', () {
    final _font = Font(
      size: 20,
      family: 'B',
    );

    expect(_font.size, 20);
    expect(_font.family, 'B');
  });

  test('Test if build returns normally', () {
    final _font = Font();

    expect(() => _font.build(), returnsNormally);
    expect(_font.build() is ZplComposer, isTrue);
  });

  test('Test if toString returns normally', () {
    final _font = Font();

    expect(() => _font.getString(), returnsNormally);
  });

  test('Test if getString() returns the right string when no child is given',
      () {
    final _font = Font(
      size: 25,
      family: 'B',
    );

    final _zplString = _font.getString();

    expect(_zplString, isNotEmpty);
    expect(_zplString, '^CFB,25');
  });

  test('Test if getString() returns the right string when a child is given',
      () {
    final _mock = ZplComposerMock();

    when(_mock.getString()).thenReturn('child_content');

    final _font = Font(
      size: 25,
      family: 'B',
      child: _mock,
    );

    final _zplString = _font.getString();

    expect(_zplString, isNotEmpty);
    expect(_zplString, equals('^CFB,25child_content'));
  });
}
