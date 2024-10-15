import '../export/AllExport.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            CircleAvatar(
              radius: 50.h,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                color: Colors.black,
                size: 50.h,
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              "Shahrukh",
              style: ThemeText.title(),
            ),
            Text(
              "email@gmail.com",
              style: ThemeText.subtitle(),
            ),
            SizedBox(height: 10.h),
            Divider(
              thickness: 4,
            ),
            SizedBox(height: 40.h),
            ListTile(
              leading: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.home,
                    color: Colors.white,
                  )),
              title: Text(
                "H O M E",
                style: ThemeText.shoetitle(Colors.white),
              ),
            ),
            ListTile(
              leading: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.person,
                    color: Colors.white,
                  )),
              title: Text(
                "P R O F I L E",
                style: ThemeText.shoetitle(Colors.white),
              ),
            ),
            ListTile(
              leading: IconButton(onPressed: (){},
                icon: Icon(
                  Icons.favorite_rounded,
                  color: Colors.white,
                ),
              ),
              title: Text(
                "W I S H L I S T",
                style: ThemeText.shoetitle(Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
                Get.toNamed(AppRoutes.WishPage);
              },
            ),
            ListTile(
              leading: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.settings,
                    color: Colors.white,
                  )),
              title: Text(
                "S E T T I N G S",
                style: ThemeText.shoetitle(Colors.white),
              ),
            ),
            ListTile(
              leading: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.exit_to_app,
                    color: Colors.white,
                  )),
              title: Text(
                "E X I T",
                style: ThemeText.shoetitle(Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
