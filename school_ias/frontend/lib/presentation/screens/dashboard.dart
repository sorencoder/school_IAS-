import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffA1C398),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Log Out'),
            ),
          )
        ],
        elevation: 0,
        backgroundColor: const Color(0xffA1C398),
        centerTitle: true,
        title: const Text(
          'DashBoard',
          style: TextStyle(
              fontFamily: 'Ubuntu', fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.tealAccent),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 45,
                        child: Icon(
                          Icons.person,
                          size: 40,
                        ),
                      ),
                      ListTile(
                        title: Text('Home'),
                        leading: Icon(Icons.home),
                      ),
                      ListTile(
                        title: Text('Home'),
                        leading: Icon(Icons.home),
                      ),
                      ListTile(
                        title: Text('Home'),
                        leading: Icon(Icons.home),
                      ),
                      ListTile(
                        title: Text('Home'),
                        leading: Icon(Icons.home),
                      ),
                      ListTile(
                        title: Text('Home'),
                        leading: Icon(Icons.home),
                      ),
                      ListTile(
                        title: Text('Home'),
                        leading: Icon(Icons.home),
                      ),
                      ListTile(
                        title: Text('Home'),
                        leading: Icon(Icons.home),
                      ),
                      ListTile(
                        title: Text('About'),
                        leading: Icon(Icons.abc),
                      ),
                    ],
                  ),
                )),
            const SizedBox(
              width: 2,
            ),
            Expanded(
                flex: 5,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.greenAccent),
                  child: const Column(
                    children: [Text('Details')],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
