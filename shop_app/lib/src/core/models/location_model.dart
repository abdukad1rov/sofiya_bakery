class LocationModel {
  const LocationModel({
    this.id,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.name,
    this.homeNumber,
    this.flatNumber,
    this.intercomCode,
    this.additionalPhoneNumber,
    this.comment,
  });

  final int? id;
  final double latitude;
  final double longitude;
  final String address;
  final String name;
  final String? homeNumber;
  final String? flatNumber;
  final String? intercomCode;
  final String? additionalPhoneNumber;
  final String? comment;

  factory LocationModel.fromJson(Map<String, Object?> json) => LocationModel(
        id: json['id'] as int,
        latitude: json['latitude'] as double,
        longitude: json['longitude'] as double,
        address: json['address'] as String,
        name: json['name'] as String,
        homeNumber: json['homeNumber'] as String,
        flatNumber: json['flatNumber'] as String,
        intercomCode: json['intercomCode'] as String,
        additionalPhoneNumber: json['additionalPhoneNumber'] as String,
        comment: json['comment'] as String,
      );

  Map<String, Object?> toJson() => <String, Object?>{
        'latitude': latitude,
        'longitude': longitude,
        'address': address,
        'name': name,
        'homeNumber': homeNumber ?? '',
        'flatNumber': flatNumber ?? '',
        'intercomCode': intercomCode ?? '',
        'additionalPhoneNumber': additionalPhoneNumber ?? '',
        'comment': comment ?? '',
      };

  @override
  bool operator ==(covariant LocationModel other) {
    return other.latitude == latitude &&
        other.longitude == longitude &&
        other.address == address &&
        other.name == name &&
        other.homeNumber == homeNumber &&
        other.flatNumber == flatNumber &&
        other.intercomCode == intercomCode &&
        other.additionalPhoneNumber == additionalPhoneNumber &&
        other.comment == comment;
  }

  @override
  int get hashCode =>
      latitude.hashCode ^
      longitude.hashCode ^
      address.hashCode ^
      name.hashCode ^
      homeNumber.hashCode ^
      flatNumber.hashCode ^
      intercomCode.hashCode ^
      additionalPhoneNumber.hashCode ^
      comment.hashCode;

  LocationModel copyWith({
    int? id,
    double? latitude,
    double? longitude,
    String? address,
    String? name,
    String? homeNumber,
    String? flatNumber,
    String? intercomCode,
    String? additionalPhoneNumber,
    String? comment,
  }) =>
      LocationModel(
        id: id ?? this.id,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        address: address ?? this.address,
        name: name ?? this.name,
        homeNumber: homeNumber ?? this.homeNumber,
        flatNumber: flatNumber ?? this.flatNumber,
        intercomCode: intercomCode ?? this.intercomCode,
        additionalPhoneNumber:
            additionalPhoneNumber ?? this.additionalPhoneNumber,
        comment: comment ?? this.comment,
      );

  @override
  String toString() => 'LocationModel('
      'latitude: $latitude,'
      'longitude: $longitude,'
      'address: $address,'
      'name: $name,'
      'homeNumber: $homeNumber,'
      'flatNumber: $flatNumber,'
      'intercomCode: $intercomCode,'
      'additionalPhoneNumber: $additionalPhoneNumber,'
      'comment: $comment)';
}
