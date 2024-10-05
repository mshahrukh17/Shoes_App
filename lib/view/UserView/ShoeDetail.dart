// ignore_for_file: must_be_immutable
import 'package:shoe_app/controller/WishListController.dart';

import '../../export/AllExport.dart';

class ShoeDetails extends StatefulWidget {
  final ShoeModel shoe;
  ShoeDetails({super.key, required this.shoe});

  @override
  State<ShoeDetails> createState() => _ShoeDetailsState();
}

class _ShoeDetailsState extends State<ShoeDetails> {
  var cartcontroller = Get.put(CartController(), permanent: true);
  var wishlistcontroller = Get.put(WishListController(), permanent: true);
  String selectedSize = "9";
  var removecart;
  // var selectedindex;
  // late Color selectedColor;

  @override
  Widget build(BuildContext context) {
    // selectedColor = widget.shoe.color;
    return Scaffold(
        body: Container(
            height: 1.sh,
            width: 1.sw,
            child: Stack(children: [
              Positioned(
                top: -20.h,
                left: 90.w,
                child: SizedBox(
                  width: 1.sw,
                  height: 1.sw / 1.1,
                  child: FadeAnimation(
                    delay: 1,
                    child: Container(
                      width: 1.sw,
                      height: 1.sw / 1.1,
                      decoration: BoxDecoration(
                        color: widget.shoe.color,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),
              Stack(
                children: [
                  Positioned(
                    top: 35.h,
                    left: 20.w,
                    right: 20.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 44.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Obx(
                          () => Container(
                            height: 44.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                                child: IconButton(
                                    onPressed: () {
                                      if (wishlistcontroller
                                          .isInFav(widget.shoe)) {
                                        wishlistcontroller
                                            .removeFromFav(widget.shoe);
                                      } else {
                                        wishlistcontroller
                                            .addToFav(widget.shoe);
                                      }
                                    },
                                    icon: Icon(
                                      wishlistcontroller.isInFav(widget.shoe)
                                          ? Icons.favorite_outlined
                                          : Icons.favorite_outline,
                                      color: wishlistcontroller
                                              .isInFav(widget.shoe)
                                          ? Colors.red
                                          : Colors.black,
                                    ))),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Shoe brand text
                  Positioned(
                    top: 1.sh * 0.24,
                    left: 0.w,
                    right: 0.w,
                    child: Center(
                      child: FadeAnimation(
                        delay: 0.5,
                        child: Text(widget.shoe.brand,
                            maxLines: 1,
                            style:
                                ThemeText.shoebrand(Colors.white24, 100.0.sp)),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 1.sh * 0.22,
                    left: 0.w,
                    right: 20.w,
                    child: Hero(
                      tag: widget.shoe.image,
                      child: RotationTransition(
                        turns: AlwaysStoppedAnimation(-25 / 360),
                        child: Container(
                          width: 1.sh * 1,
                          height: 1.sw * 0.38,
                          child: Image.asset(
                            widget.shoe.image,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Shoe details
                  Positioned(
                    left: 20.w,
                    right: 20.w,
                    bottom: 1.sh * 0.35,
                    child: FadeAnimation(
                      delay: 1.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.shoe.brand,
                                style: ThemeText.title(),
                              ),
                              Text(
                                widget.shoe.name,
                                style: ThemeText.buttontitle(),
                              ),
                            ],
                          ),
                          Text(
                            "${widget.shoe.price}k",
                            style: ThemeText.buttontitle(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Size selection
                  Positioned(
                    bottom: 1.sh * 0.2,
                    left: 20.w,
                    right: 20.w,
                    child: FadeAnimation(
                      delay: 1.8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Size", style: ThemeText.subtitle()),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              sizes("9"),
                              SizedBox(width: 15),
                              sizes("9.5"),
                              SizedBox(width: 15),
                              sizes("10"),
                              SizedBox(width: 15),
                              sizes("10.5"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Color selection and Buy button
                  Positioned(
                    left: 20.w,
                    bottom: 1.sh * 0.03,
                    right: 20.w,
                    child: FadeAnimation(
                      delay: 2.2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Color",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      height: 32,
                                      width: 32,
                                      decoration: BoxDecoration(
                                          color: widget.shoe.color,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              width: 3, color: Colors.white)),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Obx(() {
                            ShoeModel shoeWithSize = ShoeModel(
                                image: widget.shoe.image,
                                brand: widget.shoe.brand,
                                name: widget.shoe.name,
                                price: widget.shoe.price,
                                color: widget.shoe.color,
                                size: selectedSize);
                            return MaterialButton(
                              onPressed: () {
                                //  removecart = shoeWithSize;
                                if (cartcontroller.isInCart(shoeWithSize)) {
                                  cartcontroller.removeFromCart(shoeWithSize);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          backgroundColor: Colors.red,
                                          action: SnackBarAction(
                                              label: "Got it",
                                              textColor: Colors.white,
                                              backgroundColor: Colors.red,
                                              onPressed: () {}),
                                          duration: Duration(seconds: 2),
                                          elevation: 3,
                                          shape: Border.all(
                                              color: Colors.red, width: 3),
                                          content: Text(
                                            "${widget.shoe.name} remove from Cart",
                                            style: ThemeText.Scaffoldmessage(
                                                Colors.white),
                                          )));
                                } else {
                                  cartcontroller.addToCart(shoeWithSize);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          backgroundColor: widget.shoe.color,
                                          action: SnackBarAction(
                                              label: "Got it",
                                              textColor: Colors.white,
                                              backgroundColor:
                                                  widget.shoe.color,
                                              onPressed: () {}),
                                          duration: Duration(seconds: 2),
                                          elevation: 3,
                                          shape: Border.all(
                                              color: widget.shoe.color,
                                              width: 3),
                                          content: Text(
                                            "${widget.shoe.name} Added in Cart",
                                            maxLines: 1,
                                            style: ThemeText.Scaffoldmessage(
                                                Colors.white),
                                          )));
                                }
                              },
                              child: FittedBox(
                                child: Text(
                                  cartcontroller.isInCart(shoeWithSize)
                                      ? "Remove"
                                      : "Buy",
                                  style: ThemeText.buttontitle(),
                                ),
                              ),
                              color: widget.shoe.color,
                              minWidth: 1.sw * 0.3,
                              height: 1.sh * 0.09,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ])));
  }

  // Size selection container
  GestureDetector sizes(String size) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSize = size;
        });
      },
      child: Container(
        height: 35.h,
        width: 35.w,
        decoration: BoxDecoration(
            color: selectedSize == size ? widget.shoe.color : Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 2, color: Colors.white)),
        child: Center(
          child: FittedBox(
            child: Text(
              size,
              style: TextStyle(
                color: selectedSize == size ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
