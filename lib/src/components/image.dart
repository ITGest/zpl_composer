import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:hex/hex.dart';
import 'package:zpl_composer/src/composer.dart';

class Image implements ZplComposer{
  final Uint8List imageBytes;
  int x;
  int y;
  int width;
  int height;
  int total;
  int widthBytes;

  String _zplString='';

  Image(this.imageBytes,{this.x,this.y});

  @override
  ZplComposer build([ZplComposer parent]) {

  ///[WE NEED THE INCOMING IMAGE PROPERTIES, SO  FIRST WE CAST THE INT BYTELIST TO IMAGE]
  
  decodeImageFromList(imageBytes).then((data) => {
     width = data.width,
     height = data.height,
     widthBytes = width ~/ 8,
     total = widthBytes * height

  });

  ///[SECOND, CAST LIST BYTES TO HEX CODE TEXT]
  
    var hexCode = HEX.encode(imageBytes);

  ///[THEN HEX CODE TEXT TO ASCII (Unicode) TEXT]
  
    var asciiCodeText = String.fromCharCodes(HEX.decode(hexCode));
    _zplString="""^FO$x,$y^GFA,$total,$total,$widthBytes,$asciiCodeText^FS""";
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