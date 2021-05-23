import"package:flutter/material.dart";
import"dart:io";
import"package:location/location.dart" ;
class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageUrl;
  Future<void> _getcurrentlocation() async{
    final locdata=Location().getLocation();

  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width:double.infinity,
         decoration:BoxDecoration(
           border: Border.all(color: Colors.grey)
         ),
         alignment: Alignment.center,
         child: _previewImageUrl==null?Text("No location chosen",textAlign: TextAlign.center,):
         Image.network(_previewImageUrl,fit:BoxFit.cover,width: double.infinity,),

        ),
        Row(
          children: [
            FlatButton.icon(onPressed: _getcurrentlocation , icon:Icon(Icons.location_on,color:Colors.red) ,label: Text("Current location")),
          FlatButton.icon(onPressed: (){}, icon: Icon(Icons.map), label:Text("select on map")),

          ],
        )
      ],
    );
  }
}
