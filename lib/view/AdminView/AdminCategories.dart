import 'package:shoe_app/controller/ADMCategoryController.dart';

import '../../export/AllExport.dart';

class AdminCategories extends StatefulWidget {
  const AdminCategories({super.key});

  @override
  State<AdminCategories> createState() => _AdminCategoriesState();
}

class _AdminCategoriesState extends State<AdminCategories> {
  var admincatcontroller = Get.put(AdminCategoryCOntroller());
  final TextEditingController textcatcontrol = TextEditingController();
  @override
  void initState() {
    super.initState();
    getcat();
  }

  getcat() async {
    await admincatcontroller.getcategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        elevation: 5,
        onPressed: () {
          Get.dialog(
              AlertDialog(
                title: Text("Add Categories"),
                content: TextFieldWidget(
                  controller: textcatcontrol,
                  labeltext: "Add catgory",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter catname";
                    } else {
                      return null;
                    }
                  },
                ),
                actions: [
                  TextButton(
                      onPressed: () async {
                        await admincatcontroller
                            .addCategory(textcatcontrol.text);
                        textcatcontrol.clear();
                        Navigator.pop(context);
                      },
                      child: Text("Add")),
                  TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text("Cancel"))
                ],
              ),
              transitionCurve: Curves.easeIn);
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      appBar: AppBar(
        title: Text(
          "Categories",
          style: ThemeText.title(),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if (admincatcontroller.isloading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (admincatcontroller.categories.isEmpty) {
          return Center(child: Text("No Categories available"));
        } else {
          return ListView.builder(
            itemCount: admincatcontroller.categories.length,
            itemBuilder: (context, index) {
              return Text("data");
            },
          );
        }
      }),
    );
  }
}
