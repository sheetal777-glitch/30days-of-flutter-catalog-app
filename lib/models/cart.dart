import 'package:catalog_app/models/catalog.dart';

class CartModel {
  //Creating singleton
  // static final cartModel = CartModel._internal();
  // CartModel._internal();
  // factory CartModel() => cartModel;
  //catalog field
  CatalogModel? _catalog;

  // Collection of IDs - store Ids of each item
  final List<int> _itemsIds = [];

  //Get Catalog
  CatalogModel get catalog => _catalog!;

  set catalog(CatalogModel? newCatlog) {
    _catalog = newCatlog!;
  }

  //Get items in the cart
  List<Item> get items => _itemsIds.map((id) => _catalog!.getById(id)).toList();

  //Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price!);

  //Add item
  void add(Item item) {
    _itemsIds.add(item.id!);
  }

  //Remove item
  void remove(Item item) {
    _itemsIds.remove(item.id);
  }
}
