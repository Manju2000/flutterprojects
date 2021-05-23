import "package:flutter/foundation.dart";
import 'package:places_app/models/place.dart';
import "dart:io";
import"package:places_app/helpers/db_helper.dart";

class GreatPlaces with ChangeNotifier{

  List<Place> _items=[];

  List<Place> get items{
    return[..._items];
  }
  void addPlace(String title,File pickedImage){
    final newPlace=Place(id:DateTime.now().toString(),
      title: title,
      image: pickedImage,
      location:null
    );
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert("places",
        {"id":newPlace.id,
          "title":newPlace.title,
          "image":newPlace.image.path});
  }
  Future<void> fetchandsetPlaces () async{
    final datalist= await DBHelper.getData("places");
    _items= datalist.
    map((item)=>Place(
        id:item["id"],title: item["title"],
        image:File(item["image"]),location: null)).toList();
    notifyListeners();

  }


}