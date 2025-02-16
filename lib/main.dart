import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_learing_with_testing/album_model.dart';
import 'package:my_learing_with_testing/fetch_album.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch DAta Example',
      home: Scaffold(
        appBar: AppBar(title: const Text("Fetch Data Example")),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: FutureBuilder<Album>(
              future: fetchAlbum(http.Client()),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  Album album = snapshot.data!;
                  return Card(
                    child: ListTile(
                      title: Text(album.title),
                      subtitle: Text('user id : ${album.userId}'),
                      leading: Text("${album.id}"),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              },
            ),
          ),
        ),
      ),
    );
  }
}
