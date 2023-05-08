import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

@immutable
class Residence {
  final String id;
  final String block;
  final int number;
  final int floor;
  final String? info;
  Residence({
    String? id,
    required this.block,
    required this.number,
    required this.floor,
    this.info,
  }) : id = id ?? const Uuid().v4();

  Residence copyWith({
    String? id,
    String? apartmentId,
    String? apartmentName,
    String? block,
    int? number,
    int? floor,
    String? info,
  }) {
    return Residence(
      id: id ?? this.id,
      block: block ?? this.block,
      number: number ?? this.number,
      floor: floor ?? this.floor,
      info: info ?? this.info,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'block': block});
    result.addAll({'number': number});
    result.addAll({'floor': floor});
    if (info != null) {
      result.addAll({'info': info});
    }

    return result;
  }

  factory Residence.fromMap(Map<String, dynamic> map) {
    return Residence(
      id: map['id'] ?? '',
      block: map['block'] ?? '',
      number: map['number']?.toInt() ?? 0,
      floor: map['floor']?.toInt() ?? 0,
      info: map['info'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Residence.fromJson(String source) => Residence.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Residence(id: $id,  block: $block, number: $number, floor: $floor, info: $info)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Residence && other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}
