import"package:flutter/material.dart";
import "dart:io";
import"package:image_picker/image_picker.dart";
import"package:path_provider/path_provider.dart" as syspaths;
import"package:path/path.dart" as path;
class ImageInput extends StatefulWidget {
  final Function onselectimage;
  ImageInput(this.onselectimage);
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _StoredImage;
  final picker=ImagePicker();

  Future<void> _takepicture() async{
   final  imageFile = await picker.getImage(source: ImageSource.camera,maxWidth: 600);
   setState(() {
     _StoredImage=File(imageFile.path);
   });
   if(imageFile==null){
     return;
   }
   final appDir= await syspaths.getApplicationDocumentsDirectory();
   final filename= path.basename(imageFile.path);
   final savedimage= await File(imageFile.path).copy('${appDir.path}\$filename');
    widget.onselectimage(savedimage);

  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width:150,
            height: 100,
            decoration: BoxDecoration(
              border:Border.all(color:Colors.black38),
            ),
          alignment:Alignment.center,
          child: _StoredImage!=null ?Image.file(
            _StoredImage,fit:BoxFit.cover,width: double.infinity,) :
          Text("No Image Taken",textAlign: TextAlign.center,),
        ),
        SizedBox(width:10),
        Expanded(
          child: FlatButton.icon(
            label: Text("Take Picture"),
            icon:Icon(Icons.camera_alt),
            textColor: Colors.deepPurple,
            onPressed:_takepicture,

          ),
        )
      ],
    );
  }
}
