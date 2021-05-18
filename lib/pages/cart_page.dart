import 'package:catalog_app/models/cart.dart';
import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        title: "Cart".text.make(),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalPrice}"
              .text
              .xl4
              .color(context.theme.accentColor)
              .make(),
          30.widthBox,
          ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(context.theme.buttonColor)),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: "Buying not supported yet".text.make()));
                  },
                  child: "Buy".text.white.make())
              .w32(context),
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty
        ? "Nothing to show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
                leading: Icon(Icons.done),
                trailing: IconButton(
                  onPressed: () {
                    _cart.remove(_cart.items[index]);
                  },
                  icon: Icon(Icons.remove_circle_outline),
                ),
                title: _cart.items[index].name!.text.make()),
          );
  }
}
