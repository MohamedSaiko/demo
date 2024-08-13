import 'package:demo/models/album.dart';

abstract class AnyParser {
  List<Album> parseAlbums(String responseBody);
}