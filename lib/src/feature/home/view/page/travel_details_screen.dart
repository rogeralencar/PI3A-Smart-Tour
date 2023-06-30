import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:localization/localization.dart';

import '../../repository/interests_data.dart';
import '../../repository/travel_model.dart';

class TravelDetailsScreen extends StatefulWidget {
  final Travel travel;
  final String currentUserId;

  const TravelDetailsScreen(
      {super.key, required this.travel, required this.currentUserId});

  @override
  State<TravelDetailsScreen> createState() => _TravelDetailsScreenState();
}

class _TravelDetailsScreenState extends State<TravelDetailsScreen> {
  late CarouselSliderController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = CarouselSliderController();
  }

  @override
  Widget build(BuildContext context) {
    final isCurrentUserTravel = widget.travel.userId == widget.currentUserId;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.travel.destinyName),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider.builder(
              controller: _pageController,
              unlimitedMode: true,
              itemCount: widget.travel.images.length,
              slideBuilder: (index) {
                return Image.asset(
                  widget.travel.images[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                );
              },
              enableAutoSlider: true,
              slideTransform: const DepthTransform(),
              slideIndicator: CircularWaveSlideIndicator(
                itemSpacing: 16,
                indicatorRadius: 4,
                padding: const EdgeInsets.only(bottom: 12, right: 36),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'description'.i18n(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(widget.travel.description),
                  const SizedBox(height: 16),
                  Text(
                    'interests'.i18n(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: widget.travel.interests.map((interest) {
                      final interestData = interestsList
                          .firstWhere((item) => item.name == interest);
                      return Chip(
                        label: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(interestData.iconData),
                            const SizedBox(width: 4),
                            Text(interest),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'rating'.i18n(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(widget.travel.rating.toStringAsFixed(1)),
                  const SizedBox(height: 16),
                  if (isCurrentUserTravel)
                    Column(
                      children: [
                        Text(
                          'duration'.i18n(),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.travel.calculateDuration().toString(),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
