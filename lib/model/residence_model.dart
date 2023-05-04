class Residence {
  String apartmentId;
  String apartmentName;
  String block;
  int number;
  int floor;
  String? info;
  Residence({
    required this.apartmentId,
    required this.apartmentName,
    required this.block,
    required this.number,
    required this.floor,
    this.info,
  });
}
