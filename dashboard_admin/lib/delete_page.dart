import 'package:flutter/material.dart';

class DeletePage extends StatefulWidget {
  const DeletePage({super.key});

  @override
  State<DeletePage> createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {
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
              Navigator.pop(context);
            },
            child: Text("Submit"),
          ),
        ],
      ),
    ));
  }
}
