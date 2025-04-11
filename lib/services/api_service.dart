import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/car.dart';

class ApiService {
  static const baseUrl = 'https://67f7d1812466325443eadd17.mockapi.io/carros';

  static Future<List<Car>> fetchCars() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List decoded = json.decode(response.body);
      return decoded.map((json) => Car.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar carros');
    }
  }

  static Future<Car> fetchCarByQr(String codigoQr) async {
    final response = await http.get(Uri.parse('$baseUrl/$codigoQr'));
    if (response.statusCode == 200) {
      return Car.fromJson(json.decode(response.body));
    } else {
      throw Exception('Carro no encontrado');
    }
  }
}