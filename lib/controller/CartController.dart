import '../export/AllExport.dart';

class CartController extends GetxController{
 RxList cartitems = <ShoeModel>[].obs;   

 bool isInCart(ShoeModel shoe){
 return cartitems.any((item) => item.image == shoe.image && item.size == shoe.size);
 }

 addToCart(ShoeModel shoe){
    cartitems.add(shoe);
  
 }

removeFromCart(ShoeModel shoe) {
  cartitems.removeWhere((item) => item.image == shoe.image && item.size ==shoe.size);
}

}