import 'package:flutter/material.dart';

import '../../../export/AllExport.dart';

class HoriShoesList extends StatelessWidget {
  const HoriShoesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.sh * 0.46,
      width: 1.sw * 0.84,
      // color: Colors.pink,
      child: ListView.builder(
        itemCount: shoes.length,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final ShoeModel shoe = shoes[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Container(
              height: 1.sh * 0.1,
              width: 1.sw * 0.7,
              // color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Stack(
                  // fit: StackFit.expand,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(()=> ShoeDetails(shoe: shoe));
                      },
                      child: Container(
                        height: 1.sh,
                        width: 1.sw * 0.55,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(12)),
                        child: SizedBox(
                          height: 1.sh * 0.5,
                          width: 1.sw,
                          child: Stack(
                            children: [
                              Positioned(
                                  left: 50.w,
                                  bottom: 1.h,
                                  top: 1.h,
                                  child: FadeAnimation(
                                      delay: 0.5,
                                      child: Container(
                                        height: 1.sh * 0.5,
                                        width: 1.sw * 0.5,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: shoe.color),
                                      ))),
                              Positioned(
                                  top: 10.h,
                                  left: 0.w,
                                  right: 0.w,
                                  bottom: 10.h,
                                  child: Center(
                                    child: Text(
                                      shoe.brand,
                                      maxLines: 1,
                                      style: ThemeText.shoebrand(
                                          Colors.grey.shade400, 80.0.h),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 30.h,
                      left: 30.w,
                      child: FadeAnimation(
                          delay: 1,
                          child: Hero(
                            tag: shoe.image,
                            child: RotationTransition(
                                turns: AlwaysStoppedAnimation(-30 / 360),
                                child: Container(
                                    height: 200.h,
                                    width: 200.w,
                                    child: Image.asset(shoe.image))),
                          )),
                      // height: 1.sh * 0.15
                    ),
                    Positioned(
                        top: 0.h,
                        child: FittedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: FadeAnimation(
                              delay: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    shoe.name,
                                    maxLines: 1,
                                    style: ThemeText.shoetitle(Colors.black),
                                  ),
                                  Text(
                                    "${shoe.price.toString()}K",
                                    style: ThemeText.shoetitle(Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
                    Positioned(
                        bottom: 0.h,
                        child: Container(
                          height: 55.h,
                          width: 55.w,
                          decoration: BoxDecoration(
                            color: shoe.color,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(12),
                                bottomLeft: Radius.circular(8)),
                          ),
                          child: Center(
                              child: IconButton(
                                  onPressed: () {
                                    Get.to(() => ShoeDetails(shoe: shoe));
                                  },
                                  icon: Icon(
                                    Icons.shopping_cart,
                                    color: Colors.white,
                                  ))),
                        ))
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
