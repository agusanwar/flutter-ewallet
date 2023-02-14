import 'package:aipay/shared/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanQRScreens extends StatefulWidget {
  const ScanQRScreens({super.key});

  @override
  State<ScanQRScreens> createState() => _ScanQRScreensState();
}

class _ScanQRScreensState extends State<ScanQRScreens> {
  final String _scanBarcode = '';
  @override
  void initState() {
    super.initState();
  }

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kLightBackgraundColor,
        title: const Text('QR Scanner'),
      ),
      body: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => startBarcodeScanStream(),
            child: const Text('qr'),
          ),
          Text('Scan result : $_scanBarcode\n',
              style: const TextStyle(fontSize: 20))
        ],
      ),
    );
  }
}
