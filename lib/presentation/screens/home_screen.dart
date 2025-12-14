import 'package:drift_notes_app/presentation/blocs/home%20screen%20bloc/bloc/home_screen_bloc.dart';
import 'package:drift_notes_app/presentation/screens/add_screen.dart';
import 'package:drift_notes_app/core/widgets/my_text.dart';
import 'package:drift_notes_app/core/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddScreen(isEdit: false)),
          );
        },
        child: Center(child: Icon(Icons.add)),
      ),
      appBar: AppBar(title: MyText(text: "Notes Screen"), centerTitle: true),
      body: BlocBuilder<HomeScreenBloc, HomeScreenState>(
        builder: (context, state) {
          if (state is DataLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is DataLoadErrorState) {
            return Center(
              child: MyText(text: "Some Unknown error has accoured"),
            );
          } else if (state is DataLoadedState) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: state.userEntity!.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var data = state.userEntity![index];
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddScreen(
                                isEdit: true,
                                name: data.name,
                                desc: data.description,
                                phone: data.phoneNumber,
                                id: data.id,
                                verified: data.isVerified,
                              ),
                            ),
                          );
                        }
                        if (value == "delete") {
                          // db.deleteNotes(data.id);
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
                        name: data.name.toString(),
                        description: data.description.toString(),
                        phoneNumber: data.phoneNumber.toString(),
                        isVerified: data.isVerified!,
                      );
                    },
                  ),
                );
              },
            );
          }
          return SizedBox();
        },
      ),
      // body: StreamBuilder(
      //   stream: db.fetchNotes(),
      //   builder: (context, snapshot) {
      //     if (!snapshot.hasData) {
      //       return Center(child: CircularProgressIndicator());
      //     } else if (snapshot.data!.isEmpty) {
      //       return Center(child: MyText(text: "No notes are added."));
      //     } else {
      //       var fetchedData = snapshot.data;

      //       return

      //        ListView.builder(
      //         scrollDirection: Axis.vertical,
      //         itemCount: fetchedData!.length,
      //         shrinkWrap: true,
      //         itemBuilder: (context, index) {
      //           var data = fetchedData[index];
      //           return Padding(
      //             padding: const EdgeInsets.all(8.0),
      //             child: ListTile(
      //               shape: RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(12),
      //               ),
      //               tileColor: const Color.fromARGB(255, 72, 73, 73),
      //               leading: MyText(
      //                 text: data.id.toString(),
      //                 color: Colors.white,
      //               ),
      //               title: MyText(text: data.name, color: Colors.white),
      //               subtitle: Row(
      //                 children: [
      //                   MyText(text: data.phoneNumber, color: Colors.white),
      //                   SizedBox(width: 10),
      //                   data.isVerified == true
      //                       ? Icon(Icons.verified, color: Colors.green)
      //                       : Icon(Icons.verified, color: Colors.grey),
      //                 ],
      //               ),
      //               trailing: PopupMenuButton(
      //                 icon: Icon(Icons.more_vert, color: Colors.white),
      //                 onSelected: (value) {
      //                   if (value == "edit") {
      //                     Navigator.push(
      //                       context,
      //                       MaterialPageRoute(
      //                         builder: (context) => AddScreen(
      //                           isEdit: true,
      //                           name: data.name,
      //                           desc: data.description,
      //                           phone: data.phoneNumber,
      //                           id: data.id,
      //                           verified: data.isVerified,
      //                         ),
      //                       ),
      //                     );
      //                   }
      //                   if (value == "delete") {
      //                     db.deleteNotes(data.id);
      //                   }
      //                 },
      //                 itemBuilder: (context) => [
      //                   PopupMenuItem(value: "edit", child: Text("Edit")),
      //                   PopupMenuItem(value: "delete", child: Text("Delete")),
      //                 ],
      //               ),

      //               onTap: () {
      //                 showDetailsDialog(
      //                   context,
      //                   name: data.name,
      //                   description: data.description,
      //                   phoneNumber: data.phoneNumber,
      //                   isVerified: data.isVerified,
      //                 );
      //               },
      //             ),
      //           );
      //         },
      //       );
      //     }
      //   },
      // ),
    );
  }
}
