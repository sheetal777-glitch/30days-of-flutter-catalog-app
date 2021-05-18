import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
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
          ],
        ),
      ],
    );
  }
}
