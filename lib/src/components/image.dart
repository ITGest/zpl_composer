import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:hex/hex.dart';
import 'package:zpl_composer/src/composer.dart';

class Image implements ZplComposer {
  final Uint8List imageBytes;

  int x;
  int y;

  String _zplString = '';

  Image(
    this.imageBytes, {
    this.x,
    this.y,
  });

  @override
  ZplComposer build([ZplComposer parent]) {
    decodeImageFromList(imageBytes).then((data) {
      final _widthBytes = data.width ~/ 8;

      final _total = _widthBytes * data.height;

      final _hexCode = HEX.encode(imageBytes);

      final _asciiCode = String.fromCharCodes(HEX.decode(_hexCode));

      _zplString = '^FO$x,$y^GFA,$_total,$_total,$_widthBytes,$_asciiCode^FS';
    });

    return this;
  }

  @override
  ZplComposer fromString(String zplString) {
    return this;
  }

  @override
  String getString() {
    build();

    return _zplString;
  }
}
