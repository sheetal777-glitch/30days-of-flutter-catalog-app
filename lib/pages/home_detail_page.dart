import 'package:catalog_app/models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({required this.catalog});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          buttonPadding: EdgeInsets.zero,
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${catalog.price!}".text.xl4.red800.bold.make(),
            ElevatedButton(
              onPressed: () {},
              child: "Add to cart".text.xl.make(),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(context.theme.buttonColor),
                shape: MaterialStateProperty.all(StadiumBorder()),
              ),
            ).wh(120, 40)
          ],
        ).p16(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image!),
            ).h32(context),
            Expanded(
              child: VxArc(
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                height: 20.0,
                child: Container(
                  width: context.screenWidth,
                  color: context.cardColor,
                  child: Column(
                    children: [
                      catalog.name!.text.xl4
                          .color(context.accentColor)
                          .bold
                          .make(),
                      catalog.desc!.text
                          .textStyle(context.captionStyle!)
                          .xl
                          .make(),
                      10.heightBox,
                      "Stet lorem invidunt et stet dolor duo diam sit lorem, invidunt aliquyam eos gubergren tempor sit et eirmod no ut, sanctus ea vero rebum erat sed. Invidunt et accusam amet clita et accusam ipsum sea no. Justo ipsum duo aliquyam gubergren consetetur, sanctus dolores labore elitr dolor lorem. Diam no."
                          .text
                          .textStyle(context.captionStyle!)
                          .make()
                          .p8()
                    ],
                  ).py32(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
