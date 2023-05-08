import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'dart:convert';

@immutable
class Resident {
  final String id;
  final String block;
  final int residence;
  final String name;
  final String surname;
  final String phone;
  final String email;
  Resident({
    String? id,
    required this.block,
    required this.residence,
    required this.name,
    required this.surname,
    required this.phone,
    required this.email,
  }) : id = id ?? const Uuid().v4();

  Resident copyWith({
    String? id,
    String? block,
    int? residence,
    String? name,
    String? surname,
    String? phone,
    String? email,
  }) {
    return Resident(
      id: id ?? this.id,
      block: block ?? this.block,
      residence: residence ?? this.residence,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      phone: phone ?? this.phone,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'block': block});
    result.addAll({'residence': residence});
    result.addAll({'name': name});
    result.addAll({'surname': surname});
    result.addAll({'phone': phone});
    result.addAll({'email': email});

    return result;
  }

  factory Resident.fromMap(Map<String, dynamic> map) {
    return Resident(
      id: map['id'] ?? '',
      block: map['block'] ?? '',
      residence: map['residence']?.toInt() ?? 0,
      name: map['name'] ?? '',
      surname: map['surname'] ?? '',
      phone: map['phone'] ?? '',
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Resident.fromJson(String source) => Resident.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Resident(id: $id, block: $block, residence: $residence, name: $name, surname: $surname, phone: $phone, email: $email)';
  }

  @override
  bool operator ==(covariant Object other) {
    if (identical(this, other)) return true;

    return other is Resident && other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}
