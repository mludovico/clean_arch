import 'dart:convert';

import 'package:clean_arch/modules/search/domain/entities/result_search.dart';

class ResultSearchModel extends ResultSearch {
  ResultSearchModel({title, content, img})
      : super(title: title, content: content, img: img);

  Map<String, dynamic> toMap() => {
        'title': title,
        'content': content,
        'img': img,
      };

  factory ResultSearchModel.fromMap(Map<String, dynamic>? map) {
    return ResultSearchModel(
      title: map?['login'],
      content: map?['id'].toString(),
      img: map?['avatar_url'],
    );
  }

  String toJson() => jsonEncode(toMap());

  factory ResultSearchModel.fromJson(String json) =>
      ResultSearchModel.fromMap(jsonDecode(json));
}
