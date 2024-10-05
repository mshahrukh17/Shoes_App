import 'package:shoe_app/Export/AllExport.dart';
import 'package:shoe_app/controller/WishListController.dart';

import '../../export/AllExport.dart';

class WishPage extends StatelessWidget {
  const WishPage({super.key});

  @override
  Widget build(BuildContext context) {
    var wishlistcontroller = Get.put(WishListController(), permanent: true);

    return Scaffold(
      appBar: AppBar(
        title: Text("Wish List"),
        centerTitle: true,
      ),
      body: Obx(() {
        if (wishlistcontroller.wishList.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/fav-removebg-preview.png",
                  height: 1.sh * 0.3,
                  color: Colors.red,
                ),
                Text(
                  "No Wishes!",
                  style: ThemeText.title(),
                ),
                Text(
                  "Once you have added, come back:)",
                  style: ThemeText.subtitle(),
                ),
              ],
            ),
          );
        } else {
          return ListView.builder(
            itemCount: wishlistcontroller.wishList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              ShoeModel wish = wishlistcontroller.wishList[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Dismissible(
                  key: Key(wish.image.toString()),
                  background: Container(
                    color: Colors.red,
                    child : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Icon(Icons.delete, color: Colors.white),
                            ),
                            Text(
                              'Remove',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                  ),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    wishlistcontroller.removeFromFav(wish);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("${wish.name} dismissed")),
                    );
                  },
                  child: ListTile(
                    tileColor: Colors.white,
                    style: ListTileStyle.list,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    onTap: () {
                      Get.to(() => ShoeDetails(shoe: wish));
                    },
                    leading: RotationTransition(
                      turns: AlwaysStoppedAnimation(-30 / 360),
                      child: Image.asset(wish.image, height: 40),
                    ),
                    title: Text(
                      wish.name,
                      maxLines: 1,
                      style: ThemeText.shoebrand(Colors.black, 18.0),
                    ),
                    subtitle: Text(
                      "${wish.price.toString()}K",
                      style: ThemeText.shoebrand(Colors.black54, 15.0),
                    ),
                     trailing: Container(
                        height: 1.sh,
                        width: 1.sw * 0.12,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(12)),
                        child: IconButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      "Swipe left to remove ${wish.name}"),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.white,
                            )),
                      ),
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
