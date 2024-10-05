import '../../export/AllExport.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Dashboard"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               GestureDetector(
                onTap: () => Get.toNamed(AppRoutes.AdminUser),
                child: container("Users")),
              const SizedBox(width: 12,),
              GestureDetector(
                onTap: () => Get.toNamed(AppRoutes.AdminCategoriess),
                child: container("Category")),
            ],
          ),
        ],
      )
    );
  }

  Container container(text) {
    return Container(
          height: Get.height * 0.3,
          width: Get.width * 0.45,
          decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(text),
          ),
        );
  }
}