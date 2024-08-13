import 'dart:async';
import 'dart:io';
import 'package:demo/repositories/any_network_manager.dart';
import 'package:http/http.dart' as http;

class NetworkManager implements AnyNetworkManager {
  @override
  Future<T> fetchAlbums<T>(
      {required String url,
      required Future<T> Function(String response) parseResponse}) async {
    try {
      final uri = Uri.parse(url);
      final response = await http.get(uri);
      switch (response.statusCode) {
        case 200:
          return parseResponse(response.body);
        default:
          throw Exception("Something went wrong!: Code ${response.statusCode}");
      }
    } on SocketException catch (error) {
      throw SocketException(error.message);
    } on TimeoutException catch (error) {
      throw TimeoutException(error.message);
    } on http.ClientException catch (error) {
      throw http.ClientException(error.message);
    } on FormatException catch (error) {
      throw FormatException(error.message);
    }
  }
}
