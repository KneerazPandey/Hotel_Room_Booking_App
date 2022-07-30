import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:frontend/core/constants/global_url.dart';
import 'package:frontend/core/errors/http_error_handling.dart';
import 'package:frontend/models/gallery.dart';
import 'package:http/http.dart';

class GalleryService {
  Future<List<Gallery>> getGalleryImages({
    required BuildContext context,
    String? query,
  }) async {
    Uri uri = Uri.parse(GlobalUrl.galleryUrl)
        .replace(queryParameters: <String, String>{
      'query': query ?? '',
    });
    Response response = await get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    HttpErrorHandling.handleHttpError(
      response: response,
      context: context,
      onSuccess: () {},
    );
    List list = json.decode(response.body) as List;
    List<Gallery> galleryList = [];
    for (var element in list) {
      galleryList.add(Gallery.fromMap(element));
    }
    return galleryList;
  }
}
