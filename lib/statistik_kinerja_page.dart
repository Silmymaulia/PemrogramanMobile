import 'package:flutter/material.dart';

// Halaman baru untuk Statistik Kinerja
class StatistikKinerjaPage extends StatelessWidget {
  final List<Map<String, dynamic>> dosenData = [
    {'nama': 'Dosen A', 'bebanKerja': 20},
    {'nama': 'Dosen B', 'bebanKerja': 15},
    {'nama': 'Dosen C', 'bebanKerja': 25},
    {'nama': 'Dosen D', 'bebanKerja': 30},
    {'nama': 'Dosen E', 'bebanKerja': 10},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Statistik Kinerja'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dosenData.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(dosenData[index]['nama']),
                trailing: Text('${dosenData[index]['bebanKerja']} Jam'),
              ),
            );
          },
        ),
      ),
    );
  }
}