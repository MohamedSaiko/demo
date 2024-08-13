import 'package:demo/models/album.dart';
import 'package:demo/repositories/any_network_manager.dart';
import 'package:demo/repositories/any_parser.dart';
import 'package:flutter/foundation.dart';

final class ViewModel {
  late Future<List<Album>> albums;
  final AnyNetworkManager _networkManager;
  final AnyParser _parser;

  ViewModel(
      {required AnyNetworkManager networkManager, required AnyParser parser})
      : _networkManager = networkManager,
        _parser = parser;

  void fetchAlbum() async {
    albums = _networkManager.fetchAlbums(
        url: 'https://jsonplaceholder.typicode.com/albums',
        parseResponse: (response) => compute(_parser.parseAlbums, response));
  }
}
