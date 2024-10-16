import 'package:flutter/material.dart';
import 'progress_kegiatan2_page.dart';

class ProgressKegiatanPage extends StatefulWidget {
  @override
  _ProgressKegiatanPageState createState() => _ProgressKegiatanPageState();
}

class _ProgressKegiatanPageState extends State<ProgressKegiatanPage> {
  final List<String> kegiatanList = [
    'Panitia Akreditasi Jurusan Teknologi Informasi Tahun 2024',
    'Kegiatan Seminar Teknologi Informasi',
    'Pelatihan Pengembangan Diri',
    'Workshop Pemrograman Flutter',
    'Kegiatan Penelitian Bersama Mahasiswa',
    'Pengabdian Masyarakat di Desa',
    'Kegiatan Pertukaran Pelajar',
    'Pameran Inovasi dan Teknologi',
    'Kegiatan Olimpiade Sains',
    'Kegiatan Baksos (Bakti Sosial)',
    'Pelatihan Soft Skills untuk Mahasiswa',
    'Kegiatan Kunjungan Industri',
    'Kegiatan Mentoring untuk Mahasiswa Baru',
    'Konferensi Nasional Teknologi Informasi',
    'Kegiatan Webinar dan Diskusi Online',
    'Rapat Kerja Tahunan',
    'Kegiatan Olahraga dan Kebugaran',
    'Kegiatan Hari Pendidikan Nasional',
    'Kegiatan Penyuluhan Kesehatan',
  ];

  List<String> filteredKegiatanList = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Pada awalnya, tampilkan semua kegiatan
    filteredKegiatanList = kegiatanList;
  }

  void filterKegiatan(String query) {
    List<String> filtered = kegiatanList
        .where((kegiatan) => kegiatan.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      filteredKegiatanList = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Progress Kegiatan',
          style: TextStyle(color: Colors.white), // Mengubah warna teks menjadi putih
        ),
        backgroundColor: Color(0xFF11315F), // Warna biru utama
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Kolom pencarian
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Cari Kegiatan',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: filterKegiatan, // Setiap perubahan teks akan memfilter kegiatan
            ),
          ),
          // Teks "Pilihan Kegiatan"
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Pilihan Kegiatan',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF11315F), // Warna judul
              ),
            ),
          ),
          Expanded(
            // Menampung ListView
            child: ListView.builder(
              itemCount: filteredKegiatanList.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4, // Efek bayangan
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Margin untuk card
                  child: ListTile(
                    title: Text(
                      filteredKegiatanList[index],
                      style: TextStyle(
                        fontSize: 18, // Ukuran font
                        color: Colors.black, // Warna teks
                      ),
                    ),
                    onTap: () {
                      // Navigasi ke halaman ProgressKegiatan2Page dengan nama kegiatan
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProgressKegiatan2Page(kegiatan: filteredKegiatanList[index]),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}