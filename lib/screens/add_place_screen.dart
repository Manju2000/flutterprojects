import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:places_app/providers/great_places.dart';
import 'package:places_app/widgets/image_input.dart';
import 'package:places_app/widgets/location_input.dart';
import"dart:io";
import"package:provider/provider.dart";

class AddPlaceScreen extends StatefulWidget {
  static const routename="addplacescreen";
  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController=TextEditingController();
  File _pickedimage;

  void _selectedImage(File pickedimage){
    _pickedimage=pickedimage;
  }
  void _saveplace(){
    if(_titleController.text.isEmpty || _pickedimage==null) {
      return;
    }
    Provider.of<GreatPlaces>(context,listen:false).addPlace(_titleController.text, _pickedimage);
    Navigator.of(context).pop();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a new place"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
                child :Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: "title",),
                  controller:_titleController ,
                ),
                SizedBox(height: 10),
                ImageInput(_selectedImage),
                SizedBox(height:10),
                LocationInput(),

              ],
            ),
                )),
          ),
          RaisedButton.icon(
           icon: Icon(Icons.add),
            label:Text("Add Place"),
            onPressed: _saveplace,
            elevation: 0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            color: Colors.deepPurple,
          )
        ],
      ),
    );
  }
}
