import 'package:flutter_test/flutter_test.dart';
import 'package:zpl_composer/src/components/page.dart';
import 'package:zpl_composer/src/composer.dart';
import 'package:mockito/mockito.dart';

class ZplComponentMock extends Mock implements ZplComposer {}

void main() {
  test('Tests if Page is instantiable', () {
    expect(() => Page(), returnsNormally);
  });

  test('Tests if Page implements ZplComposer', () {
    expect(Page() is ZplComposer, true);
  });

  test('Tests if Page correctly passes the parameter', () {
    final _childMock = ZplComponentMock();

    final _page = Page(
      child: _childMock,
    );

    expect(_page.child, _childMock);
  });

  test('Tests if Page call to build method returns a ZplComposer', () {
    final _mock = ZplComponentMock();

    when(_mock.getString()).thenReturn('');

    final _page = Page(
      child: _mock,
    );

    expect(() => _page.build(), returnsNormally);
    expect(_page.build() is ZplComposer, true);
  });

  test('Tests if getString() returns normally', () async {
    final _childMock = ZplComponentMock();

    when(_childMock.getString()).thenReturn('Title');

    final _page = Page(
      child: _childMock,
    );

    _page.getString();

    verify(_childMock.getString()).called(1);

    final _zplString = _page.getString();

    expect(_zplString is String, true);
    expect(_zplString, contains('^XA'));
    expect(_zplString, contains('^XZ'));
    expect(_zplString, contains('^XA^CFA,23Title^XZ'));
  });

  /* test('Tests if getString() returns normally', () async {
    final _childMock = ZplComponentMock();

    when(_childMock.getString()).thenReturn('Title');

    final _page = Page(
      child: _childMock,
    );

    _page.getString();

    verify(_childMock.getString()).called(1);

    final _zplString = _page.getString();

    expect(_zplString is String, true);
    expect(_zplString, contains('^XA'));
    expect(_zplString, contains('^XZ'));
    expect(_zplString, contains('^XATitle^XZ'));
  }); */
}
