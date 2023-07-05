import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

import '../feature/home/repository/travel_model.dart';

const googleApiKey = 'AIzaSyDf7OTq3OtAmHtKQOYATKxJHrQqBwhEC5k';

class LocationUtil {
  static String generateLocationPreviewImage({
    double? latitude,
    double? longitude,
  }) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:blue%7Clabel:S%$latitude,$longitude&markers=color:green%7Clabel:G%$latitude,$longitude&markers=color:red%7Clabel:C%$latitude,$longitude&key=$googleApiKey';
  }

  static Future<String> getAddressFrom(LatLng position) async {
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$googleApiKey');
    final response = await http.get(url);
    return json
        .decode(response.body)['results'][0]['formatted_address']
        .toString();
  }

  static Future<Travel?> obterDetalhesPontosTuristicos(
      List<String> pontosTuristicos) async {
    for (String pontoTuristico in pontosTuristicos) {
      final String pesquisa = Uri.encodeQueryComponent(pontoTuristico);
      final String url =
          'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$pesquisa&inputtype=textquery&key=$googleApiKey';

      final response = await http.get(Uri.parse(url));
      final decoded = json.decode(response.body);

      if (decoded['status'] == 'OK' && decoded['candidates'].isNotEmpty) {
        final candidate = decoded['candidates'][0];
        final String nome = candidate['name'];
        final String descricao = candidate['formatted_address'];
        final double lat = candidate['geometry']['location']['lat'];
        final double lng = candidate['geometry']['location']['lng'];
        final String placeId = candidate['place_id'];

        final List<String> images = [];
        final image = await obterImagensPontoTuristico(placeId);
        if (image != null) {
          images.add(image);
          return Travel(
            destinyName: nome,
            description: descricao,
            images: images,
            latitude: lat,
            longitude: lng,
          );
        }
      }
    }
    return null;
  }

  static Future<String?> obterImagensPontoTuristico(String placeId) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&fields=photos&key=$googleApiKey';

    final response = await http.get(Uri.parse(url));
    final decoded = json.decode(response.body);

    if (decoded['status'] == 'OK' && decoded['result'].containsKey('photos')) {
      final photos = decoded['result']['photos'];
      for (var photo in photos) {
        final String photoReference = photo['photo_reference'];
        final int height = photo['height'];
        final int width = photo['width'];

        final String photoUrl =
            'https://maps.googleapis.com/maps/api/place/photo?maxheight=$height&maxwidth=$width&photoreference=$photoReference&key=$googleApiKey';

        return photoUrl;
      }
    }
    return null;
  }
}
