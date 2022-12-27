part of 'homepage_image_bloc.dart';

abstract class HomepageImageEvent {}

class SaveImageEvent extends HomepageImageEvent {
  String? filePath;
  BuildContext context;
  SaveImageEvent(this.filePath, this.context) : super() {
    saveImage();
  }

  saveImage() async {
    final dir = await getApplicationDocumentsDirectory();
    File oldFile = File(filePath ?? "");

    final newPath =
        dir.path + "/" + DateTime.now().millisecondsSinceEpoch.toString();
    print(newPath);

    try {
      await oldFile.copy(newPath);
      await DbHelper().addImage(newPath);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Image Saved Successfully"),
        backgroundColor: Colors.green,
      ));
    } catch (e) {
      print(e);
    }
  }
}
