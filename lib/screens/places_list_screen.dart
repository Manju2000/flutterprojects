import"package:flutter/material.dart";
import 'package:places_app/providers/great_places.dart';
import 'package:places_app/screens/add_place_screen.dart';
import"package:provider/provider.dart";

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Places"),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: Icon(Icons.add,),
            onPressed: (){
              Navigator.of(context).pushNamed(AddPlaceScreen.routename);
            },
          )
        ],
      ),
      body:FutureBuilder(
        future:Provider.of<GreatPlaces>(context,listen: false).fetchandsetPlaces(),
        builder:(cxt,snapshot) =>snapshot.connectionState==ConnectionState.waiting?
        Center(child:CircularProgressIndicator()):
        Consumer<GreatPlaces>(
            child:Center(child: const Text("Got no places yet,start adding some"),),
            builder: (cxt,greatplaces,ch)=> greatplaces.items.length<=0?ch:
                ListView.builder(
                  itemCount: greatplaces.items.length,
                  itemBuilder: (cxt,i)=>ListTile(
                    leading:CircleAvatar(
                      backgroundImage: FileImage(greatplaces.items[i].image),
                    ),
                    title:Text(greatplaces.items[i].title),
                    onTap: (){},
                  ),
                )
        ),
      ),
    );
  }
}
