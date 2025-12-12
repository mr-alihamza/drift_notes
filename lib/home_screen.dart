import 'package:drift_notes_app/add_screen.dart';
import 'package:drift_notes_app/utils.dart';
import 'package:drift_notes_app/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  //ghjkjhgfdfghjkjhgfghjhjj
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddScreen(isEdit: false));
        },
        child: Center(child: Icon(Icons.add)),
      ),
      appBar: AppBar(title: MyText(text: "Notes Screen"), centerTitle: true),
      body: StreamBuilder(
        stream: db.fetchNotes(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.data!.isEmpty) {
            return Center(child: MyText(text: "No notes are added."));
          } else {
            var fetchedData = snapshot.data;

            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: fetchedData!.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var data = fetchedData[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    tileColor: const Color.fromARGB(255, 72, 73, 73),
                    leading: MyText(
                      text: data.id.toString(),
                      color: Colors.white,
                    ),
                    title: MyText(text: data.name, color: Colors.white),
                    subtitle: Row(
                      children: [
                        MyText(text: data.phoneNumber, color: Colors.white),
                        SizedBox(width: 10),
                        data.isVerified == true
                            ? Icon(Icons.verified, color: Colors.green)
                            : Icon(Icons.verified, color: Colors.grey),
                      ],
                    ),
                    trailing: PopupMenuButton(
                      icon: Icon(Icons.more_vert, color: Colors.white),
                      onSelected: (value) {
                        if (value == "edit") {
                          Get.to(
                            () => AddScreen(
                              isEdit: true,
                              name: data.name,
                              desc: data.description,
                              phone: data.phoneNumber,
                              id: data.id,
                              verified: data.isVerified,
                            ),
                          );
                        }
                        if (value == "delete") {
                          db.deleteNotes(data.id);
                        }
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem(value: "edit", child: Text("Edit")),
                        PopupMenuItem(value: "delete", child: Text("Delete")),
                      ],
                    ),

                    onTap: () {
                      showDetailsDialog(
                        context,
                        name: data.name,
                        description: data.description,
                        phoneNumber: data.phoneNumber,
                        isVerified: data.isVerified,
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
