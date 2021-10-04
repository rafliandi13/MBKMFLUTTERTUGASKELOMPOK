import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submission_five/detail.dart';
import 'provider.dart';
import 'model.dart';

class BaseScreen extends StatelessWidget {
  String title,description;
  BaseScreen({Key? key, required this.title,required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[500],
      appBar: AppBar(title: Text('ContactApp'),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<ListProvider>(
          builder: (context, ListProvider data, child) {
            return data.getNotes.length != 0
                ? ListView.builder(
                    itemCount: data.getNotes.length,
                    itemBuilder: (context, index) {
                      return CardList(data.getNotes[index], index);
                    },
                  )
                : GestureDetector(
                    onTap: () {
                      Provider.of<ListProvider>(context, listen: false)
                          .addItem(title, description);
                    },
                    child: Center(
                        child: Text(
                      "ADD CONTACT",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailScreen()));
        },
        backgroundColor: Colors.white,
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CardList extends StatelessWidget {
  final DynamicList list;
  int index;

  CardList(this.list, this.index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                topLeft: Radius.circular(10),
              )),
          child: ListTile(
            leading: Icon(Icons.people),
            title: Text(list.title),
            subtitle: Text(list.description),
            trailing: IconButton(onPressed: () {
              Provider.of<ListProvider>(context, listen: false)
                  .deleteItem(index);
            }, icon: Icon(Icons.delete))
          ),
        ),
    );
  }
}

showAlertDialog(BuildContext context) {
  TextEditingController _Title = TextEditingController();
  TextEditingController _Description = TextEditingController();
  // Create button
  Widget okButton = FlatButton(
    child: Text("ADD CONTACT"),
    onPressed: () {

    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("ADD A NEW CONTACT "),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: _Title,
          decoration: InputDecoration(hintText: "Enter Name"),
        ),
        TextField(
          controller: _Description,
          decoration: InputDecoration(hintText: "Enter Mobile Phone Number"),
        ),
      ],
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
