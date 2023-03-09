import 'package:flutter/material.dart';
import 'screens/add_member.dart';
import 'screens/member_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    title: 'Gym Manager',
    initialRoute: '/',
    routes: {
      '/': (context) => const HomePage(),
      '/members': (context) => const ListMemberPage(),
      '/new': (context) => const NewMemberPage()
    },
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gym Manager')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(30),
              child: Text(
                'Welcome to Gym membership management',
                textAlign: TextAlign.center,
                textScaleFactor: 2,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/new');
                  },
                  child: const Text('Add new member'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/members');
                  },
                  child: const Text('List all members'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
