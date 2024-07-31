import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:shop/routes/navigate_page.dart';
import 'package:shop/widgets/app_text.dart';

class QRScanView extends StatefulWidget {
  const QRScanView({super.key});

  @override
  State<QRScanView> createState() => _QRScanViewState();
}

class _QRScanViewState extends State<QRScanView> with WidgetsBindingObserver {
  final MobileScannerController controller =
      MobileScannerController(formats: const [BarcodeFormat.qrCode]);
  StreamSubscription<Object?>? _subscription;
  Barcode? _barcode;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    _subscription = controller.barcodes.listen(_handleBarcode);

    unawaited(controller.start());
  }

  void _handleBarcode(BarcodeCapture barcodes) {
    if (mounted) {
      HapticFeedback.vibrate();

      if (_barcode == null) {
        _barcode = barcodes.barcodes.firstOrNull;
      } else {
        unawaited(_subscription?.cancel());
        navigate();
      }
    }
  }

  @override
  Future<void> dispose() async {
    WidgetsBinding.instance.removeObserver(this);
    unawaited(_subscription?.cancel());
    _subscription = null;
    super.dispose();
    await controller.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (!controller.value.isInitialized) {
      return;
    }

    switch (state) {
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
      case AppLifecycleState.paused:
        return;
      case AppLifecycleState.resumed:
        _subscription = controller.barcodes.listen(_handleBarcode);

        unawaited(controller.start());
      case AppLifecycleState.inactive:
        unawaited(_subscription?.cancel());
        _subscription = null;
        unawaited(controller.stop());
    }
  }

  navigate() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              // AppText('Success'),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final scanWindow = Rect.fromCenter(
      center: MediaQuery.sizeOf(context).center(Offset.zero),
      width: 200,
      height: 200,
    );
    return Scaffold(
        body: SafeArea(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: MobileScanner(
              fit: BoxFit.contain,
              controller: controller,
              scanWindow: scanWindow,
              // errorBuilder: (context, error, child) {
              //   return ScannerErrorWidget(error: error);
              // },
              // overlayBuilder: (context, constraints) {
              //   return Padding(
              //     padding: const EdgeInsets.all(16.0),
              //     child: Align(
              //       alignment: Alignment.bottomCenter,
              //       child: ScannedBarcodeLabel(barcodes: controller.barcodes),
              //     ),
              //   );
              // },
            ),
          ),
          ValueListenableBuilder(
            valueListenable: controller,
            builder: (context, value, child) {
              if (!value.isInitialized ||
                  !value.isRunning ||
                  value.error != null) {
                return const SizedBox();
              }

              return CustomPaint(
                painter: _ScannerOverlay(scanWindow: scanWindow),
              );
            },
          ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Padding(
          //     padding: const EdgeInsets.all(16.0),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: [
          //         // ToggleFlashlightButton(controller: controller),
          //         // SwitchCameraButton(controller: controller),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    ));
  }
}

class _ScannerOverlay extends CustomPainter {
  const _ScannerOverlay({
    required this.scanWindow,
    this.borderRadius = 12.0,
  });

  final Rect scanWindow;
  final double borderRadius;

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPath = Path()..addRect(Rect.largest);

    final cutoutPath = Path()
      ..addRRect(
        RRect.fromRectAndCorners(
          scanWindow,
          topLeft: Radius.circular(borderRadius),
          topRight: Radius.circular(borderRadius),
          bottomLeft: Radius.circular(borderRadius),
          bottomRight: Radius.circular(borderRadius),
        ),
      );

    final backgroundPaint = Paint()
      ..color = Colors.black.withOpacity(0.5)
      ..style = PaintingStyle.fill
      ..blendMode = BlendMode.dstOut;

    final backgroundWithCutout = Path.combine(
      PathOperation.difference,
      backgroundPath,
      cutoutPath,
    );

    final borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    final borderRect = RRect.fromRectAndCorners(
      scanWindow,
      topLeft: Radius.circular(borderRadius),
      topRight: Radius.circular(borderRadius),
      bottomLeft: Radius.circular(borderRadius),
      bottomRight: Radius.circular(borderRadius),
    );

    // First, draw the background,
    // with a cutout area that is a bit larger than the scan window.
    // Finally, draw the scan window itself.
    canvas.drawPath(backgroundWithCutout, backgroundPaint);
    canvas.drawRRect(borderRect, borderPaint);
  }

  @override
  bool shouldRepaint(_ScannerOverlay oldDelegate) {
    return scanWindow != oldDelegate.scanWindow ||
        borderRadius != oldDelegate.borderRadius;
  }
}
