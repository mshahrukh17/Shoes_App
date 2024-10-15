import '../../export/AllExport.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var cartcontroller = Get.put(CartController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My Bag",
        style: ThemeText.title()
        ),
      ),
      body: Obx(() {
        if (cartcontroller.cartitems.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/cart.png',
                  height: 1.sh * 0.3,
                ),
                Text(
                  "No Shoes Added!",
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
              itemCount: cartcontroller.cartitems.length,
              itemBuilder: (context, index) {
                final ShoeModel shoes = cartcontroller.cartitems[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Dismissible(
                    key: Key(shoes.image.toString()),
                    background: Container(
                      color: Colors.red,
                      child: Padding(
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
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          animation: CurvedAnimation(parent: kAlwaysCompleteAnimation, curve: Curves.bounceIn),
                          content: Text("${shoes.name} Removed from cart",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),
                          ),
                          duration: Duration(seconds: 1),
                          backgroundColor: Colors.red,
                        ),
                      );
                      cartcontroller.removeFromCart(shoes);
                    },
                    child: ListTile(
                      textColor: Colors.black,
                      tileColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      leading: Container(
                        height: 80.h,
                        width: 80.w,
                        decoration: BoxDecoration(
                            color: shoes.color, shape: BoxShape.circle),
                        child: Center(
                          child: RotationTransition(
                              turns: AlwaysStoppedAnimation(-25 / 360),
                              child: Image.asset(shoes.image)),
                        ),
                      ),
                      title: Text(shoes.brand),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${shoes.name}",
                            maxLines: 1,
                          ),
                          Text("${shoes.price.toString()}K "),
                          Text("Size ${shoes.size.toString()}"),
                        ],
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
                                      "Swipe left to remove ${shoes.name}"),
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
              });
        }
      }),
    );
  }
}