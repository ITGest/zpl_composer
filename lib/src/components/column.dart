import 'package:zpl_composer/src/composer.dart';

class Column implements ZplComposer {
  int x;
  int y;
  List<ZplComposer> children;

  Column({
    this.x,
    this.y,
    this.children,
  });

  @override
  Future<String> build([ZplComposer parent]) async {
    final _futures = children.map((e) => e.build(this)).toList();

    final _result = await Future.wait(_futures);

    return _result.join();
  }

  @override
  ZplComposer fromString(String zplString) {
    throw UnimplementedError();
  }
}
