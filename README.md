# ZPL Composer

A ZPL composer package

## Getting Started

This package aims to facilitate the life developers who want to dynamically builds ZPL templates

This package can help you building ZPL templates in a very Flutter friendly way

## Installation

```yml
dependencies:
  flutter:
    sdk: flutter
  zpl_composer: ^0.0.1
```

```dart
import 'package:zpl_composer/zpl_composer';
```

## Example

```dart
import 'package:zpl_composer/zpl_composer';

final _page = Page(
  child: Column(
    children: [
      Text(
          'Title',
          isBold: true,
          fontSize: 25,
        ),
      ),
      for (Product product in _products)
      	Row(
          children: [
            Flex(
              child: Text('Nome'),
            ),
            Flex(
              align: FlexAlign.right,
              child: Text(_product.name),
            ),
          ],
        ),
    ],
  ),
),

_page.toString(); // ^XA^CFA,1^FO0,0,^FDTitle^FS^XZ
```
