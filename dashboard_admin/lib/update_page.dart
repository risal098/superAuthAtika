// import 'package:dashboard_admin/create_page.dart';
import 'package:dashboard_admin/edit_page.dart';
import 'package:flutter/material.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({super.key});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              hintText: "Delete by Get Title",
              label: Text("Delete by Get Title"),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // SUBMIT BUTTON
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => EditPage()));
            },
            child: Text("Submit"),
          ),
        ],
      ),
    ));
  }
}
