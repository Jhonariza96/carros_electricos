class Car {
  final String id;
  final String conductor; // Nuevo campo
  final String placa;    // Nuevo campo
  final String imagen;   // Nuevo campo

  Car({
    required this.id,
    required this.conductor,
    required this.placa,
    required this.imagen,
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      id: json['id']?.toString() ?? 'sin-id',
      conductor: json['conductor']?.toString() ?? 'Sin conductor',
      placa: json['placa']?.toString() ?? 'Sin placa',
      imagen: json['imagen']?.toString() ?? '',
    );
  }
}