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
      child: ZplComposerMock(),
      x: 1,
      y: 2,
    );

    expect(_font.size, 20);
    expect(_font.family, 'B');
    expect(_font.child is ZplComposer, isTrue);
    expect(_font.x, 1);
    expect(_font.y, 2);
  });

  test('Test if build returns normally', () async {
    final _font = Font();

    expect(() async => await _font.build(), returnsNormally);
    expect(await _font.build() is String, isTrue);
  });

  test('Test if build() returns the right string when no child is given',
      () async {
    final _font = Font(
      size: 25,
      family: 'B',
    );

    final _zplString = await _font.build();

    expect(_zplString, isNotEmpty);
    expect(_zplString, '^CFB,25');
  });

  test('Test if build() returns the right string when a child is given',
      () async {
    final _mock = ZplComposerMock();

    when(_mock.build(null)).thenAnswer((_) async => 'child_content');

    final _font = Font(
      size: 25,
      family: 'B',
      child: _mock,
    );

    final _zplString = await _font.build();

    expect(_zplString, isNotEmpty);
    expect(_zplString, equals('^CFB,25child_content'));
  });
}
