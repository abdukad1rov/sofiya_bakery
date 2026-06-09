class BranchModel {
  const BranchModel({
    required this.isOpen,
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.email,
    required this.openingHours,
    required this.latitude,
    required this.longitude,
    required this.status,
  });

  final bool isOpen;
  final String name;
  final String address;
  final String phoneNumber;
  final String email;
  final String openingHours;
  final double latitude;
  final double longitude;
  final int status;

  Map<String, Object?> toJson() => <String, Object?>{
        'isOpen': isOpen,
        'name': name,
        'address': address,
        'phoneNumber': phoneNumber,
        'email': email,
        'openingHours': openingHours,
        'latitude': latitude,
        'longitude': longitude,
        'status': status,
      };

  factory BranchModel.fromJson(Map<String, Object?> json) => BranchModel(
        isOpen: json['isOpen'] as bool,
        name: json['name'] as String,
        address: json['address'] as String,
        phoneNumber: json['phoneNumber'] as String,
        email: json['email'] as String,
        openingHours: json['openingHours'] as String,
        latitude: json['latitude'] as double,
        longitude: json['longitude'] as double,
        status: json['status'] as int,
      );

  @override
  bool operator ==(covariant BranchModel other) {
    if (identical(this, other)) return true;

    return other.isOpen == isOpen &&
        other.name == name &&
        other.address == address &&
        other.phoneNumber == phoneNumber &&
        other.email == email &&
        other.openingHours == openingHours &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.status == status;
  }

  @override
  int get hashCode =>
      isOpen.hashCode ^
      name.hashCode ^
      address.hashCode ^
      phoneNumber.hashCode ^
      email.hashCode ^
      openingHours.hashCode ^
      latitude.hashCode ^
      longitude.hashCode ^
      status.hashCode;

  BranchModel copyWith({
    bool? isOpen,
    String? name,
    String? address,
    String? phoneNumber,
    String? email,
    String? openingHours,
    double? latitude,
    double? longitude,
    int? status,
  }) =>
      BranchModel(
        isOpen: isOpen ?? this.isOpen,
        name: name ?? this.name,
        address: address ?? this.address,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        email: email ?? this.email,
        openingHours: openingHours ?? this.openingHours,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        status: status ?? this.status,
      );

  @override
  String toString() => 'BranchModel('
      'isOpen: $isOpen,'
      'name: $name,'
      'address: $address,'
      'phoneNumber: $phoneNumber,'
      'email: $email,'
      'openingHours: $openingHours,'
      'latitude: $latitude,'
      'longitude: $longitude,'
      'status: $status)';
}
