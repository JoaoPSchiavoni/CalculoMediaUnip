import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CalculonotaPage extends StatefulWidget {
  const CalculonotaPage({super.key});

  @override
  State<CalculonotaPage> createState() => _CalculonotaPageState();
}

class _CalculonotaPageState extends State<CalculonotaPage> {
  final TextEditingController _np1Controller = TextEditingController();
  final TextEditingController _np2Controller = TextEditingController();
  final TextEditingController _pimController = TextEditingController();

  String _resultado = '0';

  @override
  void dispose() {
    _np1Controller.dispose();
    _np2Controller.dispose();
    _pimController.dispose();
    super.dispose();
  }

  void _calcular() {
    final double? np1 = double.tryParse(
      _np1Controller.text.replaceAll(',', '.'),
    );
    final double? np2 = double.tryParse(
      _np2Controller.text.replaceAll(',', '.'),
    );
    final double? pim = double.tryParse(
      _pimController.text.replaceAll(',', '.'),
    );

    if (np1 == null || np2 == null || pim == null) {
      setState(() {
        _resultado = 'Informe valores Validos';
      });
      return;
    }
    double total = 0;
    total = ((np1 * 4) + (np2 * 4) + (pim * 2)) / 10;

    setState(() {
      _resultado = total % 1 == 0
          ? total.toInt().toString()
          : total.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: SvgPicture.asset('assets/unip-logo.svg', height: 135, fit: BoxFit.contain,)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _np1Controller,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Nota da Primeira Prova(NP1)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.numbers),
              ),
            ),
            const SizedBox(height: 16),

            TextField(
              controller: _np2Controller,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Nota da Segunda Prova(NP2)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.numbers),
              ),
            ),
            const SizedBox(height: 16),

            TextField(
              controller: _pimController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Nota PIM',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.numbers),
              ),
            ),
            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: _calcular,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: const Text(
                'Calcular Media',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            const SizedBox(height: 24),

            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                      'Media Final',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 60, 63, 216),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _resultado,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
