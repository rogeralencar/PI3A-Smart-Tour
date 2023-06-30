class Travel {
  String userId;
  String destinyName;
  DateTime departureDate;
  DateTime returnDate;
  String description;
  List<String> images;
  List<String> interests;
  double rating;

  Travel({
    required this.userId,
    required this.destinyName,
    required this.departureDate,
    required this.returnDate,
    required this.description,
    required this.images,
    required this.interests,
    required this.rating,
  });

  Duration calculateDuration() {
    return returnDate.difference(departureDate);
  }
}
