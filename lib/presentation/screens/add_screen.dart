import 'dart:io';
import 'package:drift_notes_app/core/widgets/my_container.dart';
import 'package:drift_notes_app/core/widgets/my_text.dart';
import 'package:drift_notes_app/core/widgets/my_text_form_feild.dart';
import 'package:drift_notes_app/domain/entities/user_entity.dart';
import 'package:drift_notes_app/presentation/blocs/add%20screen%20bloc/bloc/add_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddScreen extends StatelessWidget {
  final bool? isEdit;
  final bool? verified;
  final int? id;
  final String? name;
  final String? desc;
  final String? phone;

  const AddScreen({
    super.key,
    this.isEdit,
    this.id,
    this.name,
    this.desc,
    this.phone,
    this.verified,
  });

  @override
  Widget build(BuildContext context) {
    final nameCtrl = TextEditingController();
    final descCtrl = TextEditingController();
    final phoneCtrl = TextEditingController();
    if (isEdit == true) {
      nameCtrl.text = name.toString();
      descCtrl.text = desc.toString();
      phoneCtrl.text = phone.toString();
    }
    // RxBool isVerified = false.obs;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocSelector<AddScreenBloc, AddScreenState, XFile?>(
              selector: (state) => state.imageFile,
              builder: (context, imageFile) {
                return InkWell(
                  onTap: () {
                    context.read<AddScreenBloc>().add(PickImageEvent());
                  },
                  child: Center(
                    child: CircleAvatar(
                      radius: 60,
                      child: imageFile != null
                          ? Image.file(File(imageFile.path), fit: BoxFit.cover)
                          : Center(child: Icon(Icons.person, size: 30)),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            MyTextFormFeild(labelText: "Enter Name", controller: nameCtrl),
            SizedBox(height: 12),
            MyTextFormFeild(
              labelText: "Enter Description",
              controller: descCtrl,
            ),
            SizedBox(height: 12),
            MyTextFormFeild(
              labelText: "Enter Phone Number",
              controller: phoneCtrl,
            ),
            SizedBox(height: 12),
            Row(
              children: [
                BlocSelector<AddScreenBloc, AddScreenState, bool>(
                  selector: (state) => state.isVerified,
                  builder: (context, state) {
                    return Checkbox(
                      value: state,
                      onChanged: (value) {
                        context.read<AddScreenBloc>().add(
                          VerifiedOrNotEvent(value: value!),
                        );
                      },
                    );
                  },
                ),

                SizedBox(width: 10),
                MyText(text: "Verify your identity."),
              ],
            ),
            SizedBox(height: 12),
            InkWell(
              onTap: () async {
                context.read<AddScreenBloc>().add(
                  AddUserEvent(
                    userEntity: UserEntity(
                      name: nameCtrl.text,
                      description: descCtrl.text,
                      phoneNumber: phoneCtrl.text,
                      isVerified: true,
                    ),
                  ),
                );
                // isEdit != true
                //     ? db
                //           .addNotes(
                //             name: nameCtrl.text,
                //             description: descCtrl.text,
                //             phoneNumber: phoneCtrl.text,
                //             isVerified: true,
                //             // isVerified.value,
                //           )
                //           .then((_) {
                //             nameCtrl.clear();
                //             descCtrl.clear();
                //             phoneCtrl.clear();
                //             // isVerified.value = false;
                //           })
                //           .then((_) {})
                //     : db
                //           .updateNotes(
                //             name: nameCtrl.text,
                //             description: descCtrl.text,
                //             phoneNumber: phoneCtrl.text,
                //             isVerified: true,
                //             //  isVerified.value,
                //             id: id!,
                //           )
                //           .then((_) {
                //             //  Get.back();
                //           });
              },
              child: Center(
                child: MyContainer(
                  color: const Color.fromARGB(255, 72, 73, 73),
                  borderRadius: BorderRadius.circular(12),
                  height: 40,
                  width: 80,
                  child: Center(
                    child: MyText(
                      text: isEdit == true ? "Save Edit" : "Save Note",
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
