import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

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
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store!.cart!._itemsIds.add(item.id!);
    throw UnimplementedError();
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store!.cart!._itemsIds.remove(item.id!);
    throw UnimplementedError();
  }
}
