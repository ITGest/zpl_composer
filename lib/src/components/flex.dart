import 'package:flutter/material.dart';
import 'package:zpl_composer/src/components/alignment.dart';
import 'package:zpl_composer/src/composer.dart';

class Flex implements ZplComposer{
  final HorizontalAlignment alignment;
  int position;

  Flex({@required this.alignment});
  @override
  ZplComposer build([ZplComposer parent]) {
    position = alignment ==HorizontalAlignment.left?50:260;

    return this;
   
  }

  @override
  ZplComposer fromString(String zplString) {

    return this;
    
  }

  @override
  String getString() {

    build();


    return position.toString();
    
  }

}