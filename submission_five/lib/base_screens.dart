import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  final List<String> Nama = [
    "Rafli",
    "Andi",
    "Rifki",
    "Sultan",
    "Yanto",
    "Budi",
    "Rama",
    "Altundri",
    "Cantika",
    "Cici",
    "Uci"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Home")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: 600,
              padding: EdgeInsets.all(25.0),
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                        title:
                            Text(Nama[index], style: TextStyle(fontSize: 30)),
                        subtitle: Text('ini subtitle dari ' + Nama[index]),
                        leading: CircleAvatar(
                          child: Text(Nama[index][0],
                              style: TextStyle(fontSize: 20)),
                        )),
                  );
                },
                itemCount: Nama.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
