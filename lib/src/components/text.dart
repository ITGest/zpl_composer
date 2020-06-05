import 'package:flutter/cupertino.dart';
import 'package:zpl_composer/src/composer.dart';

class Text implements ZplComposer {
  String text;
  double y;
  double x;
  double fontSize;
  bool bold;

  String _zplString;

  Text(this.text,{@required this.x,@required this.y, this.fontSize=23,this.bold});
  
  @override
  ZplComposer build() {

    final  boldValue = bold?'0':'A';

    _zplString = """
     ^CF$boldValue,$fontSize
     ^FO$x,$y^FD$text^FS
     """;
    return this;
  }

  @override
  ZplComposer fromString(String zplString) {
   return this;
  }

  @override
  String toString() {
   return  _zplString;
  }
}