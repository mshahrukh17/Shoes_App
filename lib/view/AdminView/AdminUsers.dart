import 'package:shoe_app/controller/UserController.dart';

import '../../export/AllExport.dart';

class AdminUsers extends StatelessWidget {
  AdminUsers({super.key});
  @override
  Widget build(BuildContext context) {
    var usercontroller = Get.put(UserController(), permanent: true);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          shape: CircleBorder(),
          onPressed: () async {
            await usercontroller.getAllUsers();
          },
          child: Icon(Icons.refresh, color: Colors.black,),
        ),
        appBar: AppBar(
          title: const Text("AllUsers"),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: usercontroller.getAllUsers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error : ${snapshot.hasError}"));
            } else {
              return Obx(() {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: usercontroller.users.length,
                  itemBuilder: (context, index) {
                    var user = usercontroller.users[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 3,
                        child: ListTile(
                          title: Text(user['name'] ?? "No Name"),
                          subtitle: Text(user['email']),
                          trailing: Text('Type : ' + user['usertype']),
                        ),
                      ),
                    );
                  },
                );
              });
            }
          },
        ));
  }
}