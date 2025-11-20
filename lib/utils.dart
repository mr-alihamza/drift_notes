import 'package:drift_notes_app/database/app_database.dart';
import 'package:flutter/material.dart';

final AppDatabase db = AppDatabase();



Future<void> showDetailsDialog(
  BuildContext context, {
  required String name,
  required String description,
  required String phoneNumber,
  required bool isVerified,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          width: 300,        // Custom width
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Details",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 15),

              Row(
                children: [
                  Text("Name: ", style: TextStyle(fontWeight: FontWeight.bold)),
                  Expanded(child: Text(name)),
                ],
              ),

              SizedBox(height: 10),

              Row(
                children: [
                  Text("Description: ", style: TextStyle(fontWeight: FontWeight.bold)),
                  Expanded(child: Text(description)),
                ],
              ),

              SizedBox(height: 10),

              Row(
                children: [
                  Text("Phone: ", style: TextStyle(fontWeight: FontWeight.bold)),
                  Expanded(child: Text(phoneNumber)),
                ],
              ),

              SizedBox(height: 10),

              Row(
                children: [
                  Text("Verified: ", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                    isVerified ? "Yes ✔" : "No ✘",
                    style: TextStyle(
                      color: isVerified ? Colors.green : Colors.red,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Close"),
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
