import 'dart:core';
import 'package:flutter/material.dart';
import 'package:zpl_composer/src/composer.dart';

class Row implements ZplComposer{
  final List<ZplComposer> children;
  List<ZplComposer> _children = List<ZplComposer>();
  String result='';

  Row({@required this.children}){
    _children = children;
  }
  @override
  ZplComposer build([ZplComposer parent]) {
    _children.forEach((compont)=> {

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
    return this.result;
  }

}