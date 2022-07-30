import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:frontend/core/constants/global_url.dart';
import 'package:frontend/core/errors/http_error_handling.dart';
import 'package:frontend/models/blog.dart';
import 'package:http/http.dart';

class BlogServices {
  Future<List<Blog>> getBlogs({
    required BuildContext context,
  }) async {
    Uri uri = Uri.parse(GlobalUrl.blogUrl);
    Response response = await get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );
    List<Blog> blogList = [];
    HttpErrorHandling.handleHttpError(
      response: response,
      context: context,
      onSuccess: () {
        List list = json.decode(response.body) as List;

        for (var element in list) {
          blogList.add(Blog.fromMap(element));
        }
      },
    );
    return blogList;
  }
}
