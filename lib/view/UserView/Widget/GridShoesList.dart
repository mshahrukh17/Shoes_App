import '../../../export/AllExport.dart';

class GridShoesList extends StatelessWidget {
  const GridShoesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      // height: 1.sh * 1.75,
      width: 1.sw,
      // color: Colors.yellow,
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: joggers.length,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.85.h,
          mainAxisSpacing: 25.h,
        ),
        itemBuilder: (context, index) {
          final ShoeModel shoe = joggers[index];
          return Container(
              // height: 1.sh * 1,
              width: 1.sw,
              // color: Colors.red,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 1.sh * 0.4,
                    width: 1.sw * 0.44,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: SizedBox(
                      height: 1.sh * 0.2,
                      width: 1.sw,
                      child: Stack(
                        children: [
                          Positioned(
                              right: -20,
                              bottom: 1.h,
                              top: 1.h,
                              child: FadeAnimation(
                                delay: 1,
                                child: CircleAvatar(
                                  radius: 50.w,
                                  backgroundColor: shoe.color,
                                ),
                              )),
                          Positioned(
                              top: 0.h,
                              left: 0.w,
                              right: 0.w,
                              bottom: 0.h,
                              child: Center(
                                child: Text(
                                  shoe.brand,
                                  maxLines: 1,
                                  style: ThemeText.shoebrand(
                                      Colors.grey.shade300, 55.0.h),
                                ),
                              )),
                          Positioned(
                            bottom: 0.h,
                            child: Container(
                              height: 50.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                  color: shoe.color,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(8),
                                      bottomLeft: Radius.circular(8))),
                              child: Center(
                                child: IconButton(
                                    onPressed: () {
                                      Get.to(() => ShoeDetails(shoe: shoe));
                                    },
                                    icon: Icon(
                                      Icons.shopping_cart,
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      right: 3,
                      child: FadeAnimation(
                        delay: 2,
                        child: RotationTransition(
                            turns: AlwaysStoppedAnimation(-30 / 360),
                            child: Hero(
                              tag: shoe.image,
                              child: Image.asset(
                                shoe.image,
                                height: 130.h,
                                width: 130.w,
                              ),
                            )),
                      )),
                  Positioned(
                      top: -4.h,
                      left: 4.w,
                      right: 0.w,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                              child: Text(
                                shoe.name,
                                maxLines: 1,
                                style: ThemeText.shoetitle(Colors.black),
                              ),
                            ),
                            Text(
                              "${shoe.price.toString()}k",
                              maxLines: 1,
                              style: ThemeText.shoetitle(Colors.black),
                            )
                          ],
                        ),
                      )),
                ],
              ));
        },
      ),
    );
  }
}
