import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submission_five/model.dart';
import 'base_screens.dart';
import 'provider.dart';

class DetailScreen extends StatefulWidget {
  final DynamicList? data;

  DetailScreen([this.data]);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _Title = TextEditingController();
  final TextEditingController _Description = TextEditingController();

  bool isUpdate = false;

  @override
  void initState() {
    super.initState();
    if (widget.data != null) {
      _Title.text = widget.data!.title;
      _Description.text = widget.data!.description;
      isUpdate = true;
    } else {
      _Title.clear();
      _Description.clear();
      isUpdate = false;
    }
  }

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
                            labelText: "Nama",
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
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Nomor Handphone",
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
              Consumer<ListProvider>(
                builder: (context, data, child) {
                  return !isUpdate
                      ? ElevatedButton(
                          onPressed: () {
                            DynamicList newData =
                                DynamicList(_Title.text, _Description.text);

                            data.addItem(newData);
                            Navigator.pop(context);
                          },
                          child: Text("Simpan"),
                        )
                      : ElevatedButton(
                          onPressed: () {
                            data.updateItem(
                              widget.data!,
                              _Title.text,
                              _Description.text,
                            );
                            Navigator.pop(context);
                          },
                          child: Text("Update"),
                        );
                },
              ),
            ],
          ),
        ));
  }
}
