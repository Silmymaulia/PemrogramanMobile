import 'package:flutter/material.dart';

// Halaman untuk Daftar Kegiatan
class DaftarKegiatanPage extends StatelessWidget {
  final List<Kegiatan> kegiatanList = [
    Kegiatan(
      nama: 'Seminar Teknologi Informasi',
      tanggal: '10',
      hari: 'Senin',
      bulan: 'Oktober',
      tahun: '2024',
    ),
    Kegiatan(
      nama: 'Workshop Flutter',
      tanggal: '12',
      hari: 'Rabu',
      bulan: 'November',
      tahun: '2024',
    ),
    Kegiatan(
      nama: 'Pameran Inovasi',
      tanggal: '15',
      hari: 'Jumat',
      bulan: 'Desember',
      tahun: '2024',
    ),
    Kegiatan(
      nama: 'Rapat Koordinasi',
      tanggal: '18',
      hari: 'Senin',
      bulan: 'Januari',
      tahun: '2025',
    ),
    Kegiatan(
      nama: 'Pelatihan Kepemimpinan',
      tanggal: '25',
      hari: 'Kamis',
      bulan: 'Februari',
      tahun: '2025',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Kegiatan'),
        backgroundColor: Color(0xFF11315F),
      ),
      body: ListView.builder(
        itemCount: kegiatanList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(kegiatanList[index].nama),
              subtitle: Text(
                '${kegiatanList[index].hari}, ${kegiatanList[index].tanggal} ${kegiatanList[index].bulan} ${kegiatanList[index].tahun}',
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailKegiatanPage(
                      kegiatan: kegiatanList[index],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class Kegiatan {
  final String nama;
  final String tanggal;
  final String hari;
  final String bulan;
  final String tahun;

  Kegiatan({
    required this.nama,
    required this.tanggal,
    required this.hari,
    required this.bulan,
    required this.tahun,
  });
}

// Halaman Detail Kegiatan
class DetailKegiatanPage extends StatelessWidget {
  final Kegiatan kegiatan;

  DetailKegiatanPage({required this.kegiatan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kegiatan.nama),
        backgroundColor: Color(0xFF11315F),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              kegiatan.nama,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Tanggal: ${kegiatan.hari}, ${kegiatan.tanggal} ${kegiatan.bulan} ${kegiatan.tahun}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: DaftarKegiatanPage(),
  ));
}
