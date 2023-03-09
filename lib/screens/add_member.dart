import 'package:flutter/material.dart';

import '../d_db.dart';
import '../date_picker.dart';
import '../db/database.dart';

class NewMemberPage extends StatelessWidget {
  const NewMemberPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Member'),
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () => {Navigator.pop(context)},
        ),
      ),
      body: const Center(child: MemberForm()),
    );
  }
}

class MemberForm extends StatefulWidget {
  const MemberForm({super.key});
  @override
  State<MemberForm> createState() => MemberFormState();
}

class MemberFormState extends State<MemberForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController startController = TextEditingController();
  TextEditingController endController = TextEditingController();

  Future<void> addMember() async {
    final db = DriftDb.instance.database;
    try {
      await db.into(db.members).insert(MembersCompanion.insert(
          name: nameController.text,
          email: emailController.text,
          end: endController.text,
          start: startController.text));
    } catch (e) {
      print(e);
    }
    Navigator.pushNamed(context, "/members");
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 400,
            child: TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(), labelText: 'Member name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter name';
                }
                return null;
              },
            ),
          ),
          SizedBox(
            width: 400,
            child: TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(), labelText: 'Member email'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter email';
                }
                return null;
              },
            ),
          ),
          SizedBox(
            width: 400,
            height: 60,
            child: TestPickerWidget(
              label: "Membership start date",
              controller: startController,
            ),
          ),
          SizedBox(
            width: 400,
            height: 60,
            child: TestPickerWidget(
              label: "Membership end date",
              controller: endController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              child: const Text('Submit'),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  await addMember();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
