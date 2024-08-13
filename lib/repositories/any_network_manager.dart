abstract class AnyNetworkManager {
  Future<T> fetchAlbums<T>(
      {required String url,
      required Future<T> Function(String response) parseResponse}) async {
    throw UnimplementedError();
  }
}
