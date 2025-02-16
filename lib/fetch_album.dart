import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_learing_with_testing/album_model.dart';

Future<Album> fetchAlbum(http.Client client) async {
  final response = await client.get(
    Uri.parse("https://jsonplaceholder.typicode.com/albums/1"),
  );
  if (response.statusCode == 200) {
    final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    return Album.fromMap(jsonResponse);
  } else {
    throw Exception('Failed to load album');
  }
}
