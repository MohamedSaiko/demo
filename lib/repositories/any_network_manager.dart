import 'package:demo/models/album.dart';

abstract class AnyNetworkManager {
  Future<List<Album>> fetchAlbums(String url);
}