import "dart:io";
import"package:flutter/foundation.dart";

class PlaceLocation{
  final double latitude;
  final double longitude;
  final String address;
  PlaceLocation({
    @required this.address,
    @required this.latitude,
    @required this.longitude
});
}

class Place{
  final String id;
  final String title;
  PlaceLocation location;
  File image;

  Place({ @required this.id,
    @required this.title,
    @required this.location,
    @required this.image

  });

}