import 'package:demo/Networking/network_manager.dart';
import 'package:demo/models/album.dart';
import 'package:demo/networking/parser.dart';
import 'package:demo/view_model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final viewModel =
      ViewModel(networkManager: NetworkManager(), parser: Parser());

  @override
  void initState() {
    super.initState();
    viewModel.fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('jsonList'),
      ),
      body: FutureBuilder<List<Album>>(
        future: viewModel.albums,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            return AlbumsList(albums: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class AlbumsList extends StatelessWidget {
  const AlbumsList({super.key, required this.albums});

  final List<Album> albums;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: albums.length,
      itemBuilder: (context, index) {
        return Text(albums[index].title);
      },
    );
  }
}
