// ignore_for_file: deprecated_member_use
import '../../export/AllExport.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var cartcontroller = Get.put(CartController());
  late Brands selectedbrand;
  @override
  void initState() {
    super.initState();
    selectedbrand = brands[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(child: MyDrawer()),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 40, left: 15, right: 15, bottom: 5),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/logo2.webp",
                    color: Colors.white,
                    height: 40.h,
                  ),
                  Spacer(),
                  Builder(builder: (context) {
                    return IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: SvgPicture.asset(
                          'assets/icons/menu.svg',
                          // color: Colors.white,
                          width: 28.h,
                        ));
                  }),
                  Obx(() {
                    if (cartcontroller.cartitems.isEmpty) {
                      return IconButton(
                          onPressed: () {
                            Get.toNamed(AppRoutes.CartPage);
                          },
                          icon: Icon(
                            Icons.shopping_bag,
                            color: Colors.white,
                          ));
                    } else {
                      return Badge(
                        alignment: Alignment.topLeft,
                        backgroundColor: Colors.white,
                        label: Text(cartcontroller.cartitems.length.toString()),
                        child: IconButton(
                            onPressed: () {
                              Get.toNamed(AppRoutes.CartPage);
                            },
                            icon: Icon(
                              Icons.shopping_bag,
                              color: Colors.white,
                            )),
                      );
                    }
                  })
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        RotatedBox(
                          quarterTurns: -1,
                          child: Row(
                            children: [
                              Container(
                                height: 1.sh * 0.075,
                                width: 1.sw * 0.85,
                                // color: Colors.red,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: brands.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                          right: 20.0,
                                        ),
                                        child: Center(
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                selectedbrand = brands[index];
                                              });
                                            },
                                            child: Text(
                                              brands[index].brand,
                                              style: TextStyle(
                                                  color: selectedbrand ==
                                                          brands[index]
                                                      ? Colors.white
                                                      : Colors.grey.shade500,
                                                  fontSize: selectedbrand ==
                                                          brands[index]
                                                      ? 24
                                                      : 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        HoriShoesList()
                      ],
                    ),
                    GridShoesList()
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
