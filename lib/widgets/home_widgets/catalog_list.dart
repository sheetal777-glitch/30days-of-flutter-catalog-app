import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/pages/home_detail_page.dart';
import 'package:catalog_app/widgets/home_widgets/add_to_cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return !context.isMobile
        ? GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 20),
            shrinkWrap: true,
            itemCount: CatalogModel.items.length,
            itemBuilder: (BuildContext context, int index) {
              final catalog = CatalogModel.items[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => HomeDetailPage(catalog: catalog),
                    ),
                  );
                },
                child: CatalogItem(catalog: catalog),
              );
            },
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: CatalogModel.items.length,
            itemBuilder: (BuildContext context, int index) {
              final catalog = CatalogModel.items[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => HomeDetailPage(catalog: catalog),
                    ),
                  );
                },
                child: CatalogItem(catalog: catalog),
              );
            },
          );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({required this.catalog});
  @override
  Widget build(BuildContext context) {
    var children2 = [
      Hero(
        tag: Key(catalog.id.toString()),
        child: CatalogImage(image: catalog.image!),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name!.text.lg.color(context.accentColor).bold.make(),
            catalog.desc!.text.textStyle(context.captionStyle!).make(),
            10.heightBox,
            ButtonBar(
              buttonPadding: EdgeInsets.zero,
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                "\$${catalog.price!}".text.xl.bold.make(),
                AddToCart(
                  catalog: catalog,
                )
              ],
            ).pOnly(right: 8.0)
          ],
        ).p(context.isMobile ? 0 : 16),
      ),
    ];
    return VxBox(
      child: context.isMobile
          ? Row(
              children: children2,
            )
          : Column(
              children: children2,
            ),
    ).color(context.cardColor).rounded.square(150).make().py16();
  }
}
