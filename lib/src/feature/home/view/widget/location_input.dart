import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:localization/localization.dart';

import '../../../../common/location_util.dart';
import '../page/map_screen.dart';

// ignore: must_be_immutable
class LocationInput extends StatefulWidget {
  double latitude;
  double longitude;

  LocationInput(this.latitude, this.longitude, {Key? key}) : super(key: key);

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;

  void _showPreview(double lat, double lng) {
    final staticMapImageUrl = LocationUtil.generateLocationPreviewImage(
      latitude: lat,
      longitude: lng,
    );

    setState(() {
      _previewImageUrl = staticMapImageUrl;
    });
  }

  Future<void> _selectOnMap() async {
    widget.latitude = 37.419857;
    widget.longitude = -122.078827;

    final LatLng? selectedPosition = await Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (ctx) => MapScreen(
          initialLocation: LatLng(
            widget.latitude,
            widget.longitude,
          ),
        ),
      ),
    );

    if (selectedPosition == null) return;

    _showPreview(selectedPosition.latitude, selectedPosition.longitude);
  }

  @override
  Widget build(BuildContext context) {
    _showPreview(
      widget.latitude,
      widget.longitude,
    );
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Theme.of(context).colorScheme.outline,
              ),
              borderRadius: BorderRadius.circular(10)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: _previewImageUrl == null
                ? Text('location_not_provided'.i18n())
                : Image.network(
                    _previewImageUrl!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              icon: const Icon(Icons.map),
              label: Text('select_on_map'.i18n()),
              onPressed: _selectOnMap,
            ),
          ],
        )
      ],
    );
  }
}
