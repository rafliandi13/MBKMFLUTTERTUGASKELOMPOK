import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'detail.dart';
import 'provider.dart';
import 'model.dart';

class BaseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[500],
      appBar: AppBar(
        title: Text('ContactApp'),
        automaticallyImplyLeading: false,
      ),
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
                    onTap: () {},
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
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(),
          ),
        ),
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
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => DetailScreen(list)));
            },
            leading: Icon(Icons.people),
            title: Text(list.title),
            subtitle: Text(list.description),
            trailing: IconButton(
                onPressed: () {
                  Provider.of<ListProvider>(context, listen: false)
                      .deleteItem(list);
                },
                icon: Icon(Icons.delete))),
      ),
    );
  }
}
