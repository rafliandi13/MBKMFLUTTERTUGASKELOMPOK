import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submission_five/base_screens.dart';
import 'provider.dart';
import 'model.dart';
class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _Title = TextEditingController();
  TextEditingController _Description = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('ContactApp'),),
        body: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _Title,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter Name",
                        contentPadding: EdgeInsets.all(20.0),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter Name !';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _Description,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter Phone Number",
                        contentPadding: EdgeInsets.all(20.0),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter Phone Number !';
                        }
                        return null;
                      },
                    ),
                  ],
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {

                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => BaseScreen(title: _Title.text,description: _Description.text,)));

                    }
                  },
                  child: Text('Add'),
                ),
              ),
            ],
          ),
        ));
  }
}
