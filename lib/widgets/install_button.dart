
import 'package:flutter/material.dart';
import 'dart:html' as html;

class PwaInstallButton extends StatefulWidget {
  const PwaInstallButton({super.key});

  @override
  State<PwaInstallButton> createState() => _PwaInstallButtonState();
}

class _PwaInstallButtonState extends State<PwaInstallButton> {
  bool _isInstallable = false;
  dynamic _deferredPrompt;

  @override
  void initState() {
    super.initState();
    _listenInstallPrompt();
  }

  void _listenInstallPrompt() {
    html.window.addEventListener('beforeinstallprompt', (event) {
      event.preventDefault();

      _deferredPrompt = event;

      setState(() {
        _isInstallable = true;
      });
    });
  }

  void _installPwa() async {
    if (_deferredPrompt == null) return;

    try {
      _deferredPrompt.prompt();

      final result = await _deferredPrompt.userChoice;

      if (result.outcome == 'accepted') {
        print('✅ PWA instalada');
      } else {
        print('❌ Usuario canceló la instalación');
      }
    } catch (e) {
      print('Error instalando PWA: $e');
    }

    setState(() {
      _isInstallable = false;
      _deferredPrompt = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInstallable) return const SizedBox.shrink();

    return ElevatedButton.icon(
      onPressed: _installPwa,
      icon: const Icon(Icons.download),
      label: const Text('Instalar aplicación'),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF0175C2),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
    );
  }
}