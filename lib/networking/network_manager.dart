import 'package:demo/models/album.dart';
import 'package:demo/repositories/any_network_manager.dart';
import 'package:demo/repositories/any_parser.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class NetworkManager implements AnyNetworkManager {
  final AnyParser _parser;
  NetworkManager({required AnyParser parser}) : _parser = parser;

  @override
  Future<List<Album>> fetchAlbums(String url) async {
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return compute(_parser.parseAlbums, response.body);
      } else {
        throw Exception('Failed To Load Album');
      }
    }
}