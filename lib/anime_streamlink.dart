library anime_streamlink;

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

Future getAnimeStreamlink(String embededUrl) async {
  String? streamLink;

  try {
    var response = await http.Client().get(
      Uri.parse(embededUrl),
    );

    if (response.statusCode == 200) {
      var document = parse(response.body);
      streamLink = document.getElementsByTagName("iframe")[0].attributes['src'];
    }
  } catch (error) {
    log(error.toString());
    return null;
  }

  return streamLink!;
}
