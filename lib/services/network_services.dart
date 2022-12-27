import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pet_perfect/models/posts.dart';

class NetworkServices {
  static Future<File> getImages() async {
    try {
      final res = await Dio().get("https://random.dog/woof.json");

      if (res.statusCode == 200) {
        final dir = await getApplicationDocumentsDirectory();
        final filePath = dir.path + "/temp";
        print(filePath);

        await Dio().download(res.data['url'], filePath);
        return File(filePath);
      } else {
        throw "Error Encountered";
      }
    } catch (e) {
      throw e;
    }
  }

  static Future<List<Post>> getPosts() async {
    final res = await Dio().get("http://jsonplaceholder.typicode.com/posts");

    if (res.statusCode == 200) {
      final data = res.data;

      return (data as List).map((mp) => Post.fromJson(mp)).toList();
    } else {
      throw "Error Encountered";
    }
  }
}
