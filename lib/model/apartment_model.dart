import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

@immutable
class Apartment {
  final String id;
  final String name;
  final String address;
  final String warming;

  Apartment({
    String? id,
    required this.name,
    required this.address,
    required this.warming,
  }) : id = id ?? const Uuid().v4();

  Apartment copyWith({
    String? id,
    String? name,
    String? address,
    String? warming,
  }) {
    return Apartment(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      warming: warming ?? this.warming,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'adress': address});
    result.addAll({'warming': warming});

    return result;
  }

  factory Apartment.fromMap(Map<String, dynamic> map) {
    return Apartment(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      address: map['adress'] ?? '',
      warming: map['warming'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Apartment.fromJson(String source) => Apartment.fromMap(json.decode(source));

  @override
  String toString() => 'Apartment(name: $name, adress: $address, warming: $warming)';

  @override
  bool operator ==(covariant Object other) {
    if (identical(this, other)) return true;

    return other is Apartment && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
