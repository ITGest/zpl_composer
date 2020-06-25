import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:hex/hex.dart';
import 'package:zpl_composer/src/composer.dart';

class Image implements ZplComposer {
  final Uint8List imageBytes;

  int x;
  int y;

  Image(
    this.imageBytes, {
    this.x,
    this.y,
  });

  @override
  Future<String> build([ZplComposer parent]) async {
    final _data = await decodeImageFromList(imageBytes);

    final _widthBytes = _data.width ~/ 8;

    final _total = _widthBytes * _data.height;

    final _hexCode = HEX.encode(imageBytes);

    final _asciiCode = String.fromCharCodes(HEX.decode(_hexCode));

    return '^FO$x,$y^GFA,$_total,$_total,$_widthBytes,$_asciiCode^FS';
  }

  @override
  ZplComposer fromString(String zplString) {
    return this;
  }
}
