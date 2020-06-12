import 'package:flutter_test/flutter_test.dart';
import 'package:zpl_composer/src/components/column.dart';
import 'package:zpl_composer/src/components/flex/align.dart';
import 'package:zpl_composer/src/components/flex/flex.dart';
import 'package:zpl_composer/src/components/font.dart';
import 'package:zpl_composer/src/components/page.dart';
import 'package:zpl_composer/src/components/row.dart';
import 'package:zpl_composer/src/components/text.dart';

void main() {
  test('ZPL', () {
    final _page = Page(
      width: 201,
      child: Font(
        child: Column(
          children: [
            Text(
              'Title',
            ),
            for (String _product in ['Mango', 'Banana', 'Orange', 'Apple'])
              Row(
                children: [
                  Flex(
                    child: Text('Name'),
                  ),
                  Flex(
                    align: FlexAlign.right,
                    child: Text(_product),
                  ),
                ],
              ),
          ],
        ),
      ),
    );

    print(_page.getString());
  });
}
