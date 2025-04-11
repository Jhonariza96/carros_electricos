import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QRScanScreen extends StatefulWidget {
  const QRScanScreen({super.key});

  @override
  State<QRScanScreen> createState() => _QRScanScreenState();
}

class _QRScanScreenState extends State<QRScanScreen> {
  String _scanResult = "Escanea un código QR";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Escanear QR'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _scanQRCode,
              child: const Text("Escanear QR"),
            ),
            SizedBox(height: 20),
            Text(_scanResult, style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }

  Future<void> _scanQRCode() async {
    String scanResult = await FlutterBarcodeScanner.scanBarcode(
      '#ff6666', // Color del borde del scanner
      'Cancelar', // Texto para el botón de cancelar
      true, // Activar la linterna (flash)
      ScanMode.QR, // Escanear solo códigos QR
    );
    if (scanResult != "-1") { // Si no se canceló el escaneo
      setState(() {
        _scanResult = scanResult;
      });
    }
  }
}
