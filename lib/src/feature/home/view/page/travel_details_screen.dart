import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:localization/localization.dart';

import '../../repository/travel_model.dart';
import '../widget/location_input.dart';

class TravelDetailsScreen extends StatefulWidget {
  final Travel travel;

  const TravelDetailsScreen({super.key, required this.travel});

  @override
  State<TravelDetailsScreen> createState() => _TravelDetailsScreenState();
}

class _TravelDetailsScreenState extends State<TravelDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.travel.destinyName),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
              ),
              items: widget.travel.images.map((image) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'description'.i18n(),
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(widget.travel.description, textAlign: TextAlign.justify),
                  const SizedBox(height: 16),
                  LocationInput(
                      widget.travel.latitude, widget.travel.longitude),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
