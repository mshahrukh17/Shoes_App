import '../export/AllExport.dart';

class WishListController extends GetxController{
 RxList wishList = <ShoeModel>[].obs;

 bool isInFav(ShoeModel shoe){
  return wishList.any((element) => element.image == shoe.image);
 }

 addToFav(ShoeModel shoe){
  wishList.add(shoe);
 }

 removeFromFav(ShoeModel shoe){
  wishList.removeWhere((element) => element.image == shoe.image);
 }
}