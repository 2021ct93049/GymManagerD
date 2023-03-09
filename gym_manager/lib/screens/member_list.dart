import 'package:flutter/material.dart';
import 'package:gym_manager/d_db.dart';

import '../db/database.dart';

class ListMemberPage extends StatefulWidget {
  const ListMemberPage({super.key});

  @override
  State<ListMemberPage> createState() => _ListMemberPageState();
}

class _ListMemberPageState extends State<ListMemberPage> {
  Future<List<Member>> members() async {
    final db = DriftDb.instance.database;
    List<Member> members = await db.select(db.members).get();
    return members;

    // final db = await GymDB.instance.database;
    // final List<Map<String, dynamic>> maps = await db.query('members');
    // return List.generate(
    //     maps.length,
    //     (index) => Member(
    //         id: maps[index]['id'],
    //         name: maps[index]['name'],
    //         email: maps[index]['email'],
    //         end: maps[index]['end'],
    //         start: maps[index]['start']));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Members'),
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () => {Navigator.pop(context)},
        ),
      ),
      body: FutureBuilder(
          future: members(),
          builder: (context, snapshot) {
            List<Member> memberList = [];
            if (snapshot.hasError) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Text(
                    'Error in fetching list members from database',
                    textAlign: TextAlign.center,
                    textScaleFactor: 2,
                  ),
                ),
              );
            } else if (!snapshot.hasData) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Text(
                    'Loading ...',
                    textAlign: TextAlign.center,
                    textScaleFactor: 2,
                  ),
                ),
              );
            } else if (snapshot.data!.isEmpty) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Text(
                    'No members in your Gym yet :(',
                    textAlign: TextAlign.center,
                    textScaleFactor: 2,
                  ),
                ),
              );
            } else {
              memberList = snapshot.data!;
              return Center(
                  child: ListView.builder(
                itemCount: memberList.length,
                prototypeItem: ListTile(title: Text(memberList.first.name)),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(memberList[index].name),
                    subtitle: Text(memberList[index].email),
                  );
                },
              ));
            }
          }),
    );
  }
}
