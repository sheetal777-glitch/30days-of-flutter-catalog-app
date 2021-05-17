import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatefulWidget {
  @override
  _CatalogHeaderState createState() => _CatalogHeaderState();
}

class _CatalogHeaderState extends State<CatalogHeader> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(context.theme.accentColor).make(),
        Row(
          children: [
            "Trending products"
                .text
                .color(context.theme.accentColor)
                .xl2
                .make(),
            Switch(
                value: switchValue,
                onChanged: (val) {
                  setState(() {
                    val = switchValue;
                  });
                  print("switched");
                }),
          ],
        ),
      ],
    );
  }
}
