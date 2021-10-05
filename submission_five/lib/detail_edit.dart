import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'base_screens.dart';
import 'provider.dart';

class DetailScreenEdit extends StatefulWidget {
  String title, description;
  int index;

  DetailScreenEdit(
      {Key? key,
      required this.index,
      required this.title,
      required this.description});

  @override
  _DetailScreenEditState createState() => _DetailScreenEditState();
}

class _DetailScreenEditState extends State<DetailScreenEdit> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _Title = TextEditingController();
  final TextEditingController _Description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ContactApp'),
        ),
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
                            hintText: widget.title,
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
                            hintText: widget.description,
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
                      Provider.of<ListProvider>(context, listen: false)
                          .updateItem(
                              widget.index, _Title.text, _Description.text);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BaseScreen(
                                  title: _Title.text,
                                  description: _Description.text,
                                )),
                      );
                    }
                  },
                  child: const Text('Edit Simpan'),
                ),
              ),
            ],
          ),
        ));
  }
}
