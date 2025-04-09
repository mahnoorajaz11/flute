


import 'package:fahad_project/StateManagement/cart_model.dart';
import 'package:flutter/material.dart';

class CartController extends ChangeNotifier{
  final Map<String,CartItem> _items={};



  Map<String, CartItem>get items{
    return {..._items};
  }

  void addItem(String productId, String title, double price){
    if(_items.containsKey(productId)){
      _items.update(productId, (eitem)=>CartItem(
          id: eitem.id,
          title:eitem.title,
          quantity: eitem.quantity,
          price: eitem.price
      ));
    }else{
      _items.putIfAbsent(productId, ()=>CartItem(
          id: DateTime.now().toString(),
          title:title,
          quantity: 1,
          price: price,
      ));

    }
    notifyListeners();
  }
void increaseQuantity(String id) {
    if (_items.containsKey(id)) {
      _items.update(id, (existingItem) {
        return CartItem(
          id: existingItem.id,
          title: existingItem.title,
          price: existingItem.price,
          quantity: existingItem.quantity! + 1,
        );
      });
      notifyListeners();
    }
  }

  void decreaseQuantity(String id) {
    if (_items.containsKey(id)) {
      final currentQuantity = _items[id]!.quantity;
      if (currentQuantity! > 1) {
        _items.update(id, (existingItem) {
          return CartItem(
            id: existingItem.id,
            title: existingItem.title,
            price: existingItem.price,
            quantity: existingItem.quantity! - 1,
          );
        });
      } else {
        _items.remove(id);
      }
      notifyListeners();
    }
  }


  void removeItems(String productId){
    _items.remove(productId);
    notifyListeners();
  }
  double get totalAmount{
    return _items.values.fold(0.0, (sum,item)
    =>  sum+(item.price! * item.quantity!),
    );
  }
  void clear(){
    _items.clear();
    notifyListeners();
  }
}