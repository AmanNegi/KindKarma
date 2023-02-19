import 'package:flutter/material.dart';
import 'package:kindkarma/data/api.dart';
import 'package:kindkarma/globals.dart';
import 'package:kindkarma/widgets/action_button.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({super.key});

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  String name = "", description = "", place = "", phone = "", email = "";
  String organizers = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Event"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildTextField("Name", (e) => name = e.trim()),
            _buildTextField("Description", (e) => description = e.trim()),
            _buildTextField("Place", (e) => place = e.trim()),
            _buildTextField("Phone Number", (e) => phone = e.trim()),
            _buildTextField("Email", (e) => email = e.trim()),
            _buildTextField("Organizers seperated by comma", (e) {
              organizers = e.trim();
            }),
            SizedBox(height: 0.1 * getHeight(context)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: ActionButton(
                text: "Add Event",
                onPressed: () async {
                  List<String> result = organizers.split(',');
                  Map<String, dynamic> data = {
                    "name": name,
                    "description": description,
                    "place": place,
                    "organizers": result,
                    "participants": [],
                    "helpDetails": {
                      "phone": phone,
                      "email": email,
                    },
                  };

                  print("Sending Data $data");
                  await addEvent(data);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildTextField(String text, Function onChange) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: TextField(
          maxLines: null,
          onChanged: (e) => onChange(e),
          decoration: InputDecoration(
            hintText: text,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              top: 10.0,
              bottom: 10.0,
            ),
          ),
        ),
      ),
    );
  }
}
