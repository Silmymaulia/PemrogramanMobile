import 'package:flutter/material.dart';

class DokumenSuratTugasPage extends StatelessWidget {
  // Daftar nama kegiatan (misalnya diambil dari API atau database)
  final List<Map<String, String>> kegiatanSuratTugas = [
    {'namaKegiatan': 'Kegiatan 1: Seminar', 'filePath': 'path/to/surat_tugas1.pdf'},
    {'namaKegiatan': 'Kegiatan 2: Workshop', 'filePath': 'path/to/surat_tugas2.pdf'},
    {'namaKegiatan': 'Kegiatan 3: Rapat', 'filePath': 'path/to/surat_tugas3.pdf'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text(
          'Dokumen Surat Tugas',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF11315F), // Warna latar belakang AppBar
        iconTheme: IconThemeData(color: Colors.white), // Atur warna panah kembali menjadi putih

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: kegiatanSuratTugas.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                title: Text(kegiatanSuratTugas[index]['namaKegiatan']!),
                trailing: ElevatedButton(
                  onPressed: () {
                    // Logika untuk mengunduh surat tugas
                    _unduhSuratTugas(kegiatanSuratTugas[index]['filePath']!);
                  },
                  child: Text('Unduh Surat Tugas'),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _unduhSuratTugas(String filePath) {
    // Logika untuk mengunduh surat tugas
    print('Mengunduh surat tugas dari: $filePath');
    //logika pengunduhan sesuai kebutuhan Anda
  }
}
