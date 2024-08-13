import 'dart:convert';
import 'package:demo/models/album.dart';
import 'package:demo/repositories/any_parser.dart';

final class Parser extends AnyParser {
  @override
  List<Album> parseAlbums(String responseBody) {
    final parsed =(jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();
    return parsed.map<Album>((json) => Album.fromJson(json)).toList();
  }
}