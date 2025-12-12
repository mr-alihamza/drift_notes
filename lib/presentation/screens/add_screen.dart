import 'package:drift_notes_app/core/widgets/my_container.dart';
import 'package:drift_notes_app/core/widgets/my_text.dart';
import 'package:drift_notes_app/core/widgets/my_text_form_feild.dart';
import 'package:drift_notes_app/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    Rx<bool?> verif = verified.obs;
    if (isEdit == true) {
      nameCtrl.text = name.toString();
      descCtrl.text = desc.toString();
      phoneCtrl.text = phone.toString();
    }
    RxBool isVerified = false.obs;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {},
              child: Center(
                child: CircleAvatar(
                  radius: 60,
                  child: Center(child: Icon(Icons.person,size: 30,)),
                ),
              ),
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
                Obx(
                  () => Checkbox(
                    value: isEdit == true ? verif.value : isVerified.value,
                    onChanged: (value) {
                      isVerified.value = value!;
                      verif.value = value;
                    },
                  ),
                ),
                SizedBox(width: 10),
                MyText(text: "Verify your identity."),
              ],
            ),
            SizedBox(height: 12),
            InkWell(
              onTap: () async {
                isEdit != true
                    ? db
                          .addNotes(
                            name: nameCtrl.text,
                            description: descCtrl.text,
                            phoneNumber: phoneCtrl.text,
                            isVerified: isVerified.value,
                          )
                          .then((_) {
                            nameCtrl.clear();
                            descCtrl.clear();
                            phoneCtrl.clear();
                            isVerified.value = false;
                          })
                          .then((_) {
                            Get.back();
                          })
                    : db
                          .updateNotes(
                            name: nameCtrl.text,
                            description: descCtrl.text,
                            phoneNumber: phoneCtrl.text,
                            isVerified: isVerified.value,
                            id: id!,
                          )
                          .then((_) {
                            Get.back();
                          });
              },
              child: Center(
                child: MyContainer(
                  color: const Color.fromARGB(255, 72, 73, 73),
                  borderRadius: BorderRadius.circular(12),
                  height: 40,
                  width: Get.width - 70,
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
