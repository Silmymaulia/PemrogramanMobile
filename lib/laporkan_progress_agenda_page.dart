import 'package:flutter/material.dart';
import 'laporkan_progress_agenda2_page.dart'; 

class LaporkanProgressAgendaPage extends StatefulWidget {
  @override
  _LaporkanProgressAgendaPageState createState() => _LaporkanProgressAgendaPageState();
}

class _LaporkanProgressAgendaPageState extends State<LaporkanProgressAgendaPage> {
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
          'Progress Agenda',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF11315F),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Cari Kegiatan',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: filterKegiatan,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Pilihan Kegiatan',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF11315F),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredKegiatanList.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text(
                      filteredKegiatanList[index],
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LaporkanProgressAgenda2Page(kegiatan: filteredKegiatanList[index]),
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
