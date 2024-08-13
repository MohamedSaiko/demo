import 'package:demo/models/album.dart';
import 'package:demo/repositories/any_network_manager.dart';

final class ViewModel {
  final AnyNetworkManager _networkManager;
  late Future<List<Album>> albums;

  ViewModel({required AnyNetworkManager networkManager}) : _networkManager = networkManager;

  void fetchAlbum() async {
    albums = _networkManager.fetchAlbums('https://jsonplaceholder.typicode.com/albums');
  }
}