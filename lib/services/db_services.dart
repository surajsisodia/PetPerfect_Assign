import 'package:hive/hive.dart';

class DbHelper {
  Box? hive;

  initDb() async {
    hive = await Hive.openBox("dataBox");
  }

  Future<void> addImage(String filePath) async {
    if (hive == null) await initDb();

    final res = await hive!.add(filePath);
    print("Image path saved to db Successfully : $res");
  }
}
