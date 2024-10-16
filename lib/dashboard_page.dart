import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF11315F),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.account_circle, color: Colors.white, size: 80),
                SizedBox(height: 10),
                Flexible( // Tambahkan Flexible agar teks bisa diatur lebih fleksibel
                  child: Text(
                    'Zefanya Tiomora Siagian',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    overflow: TextOverflow.ellipsis, // Tambahkan ini
                    maxLines: 1, // Batasi teks hanya satu baris
                  ),
                ),
                Text(
                  '123456789',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          ExpansionTile(
            leading: Icon(Icons.event_note, color: Color(0xFF11315F)),
            title: Text('Manajemen Kegiatan'),
            children: <Widget>[
              ListTile(
                title: Text('Agenda Kegiatan'),
                onTap: () {
                  Navigator.pushNamed(context, '/agenda-kegiatan');
                },
              ),
              ListTile(
                title: Text('Progress Kegiatan'),
                onTap: () {
                  Navigator.pushNamed(context, '/progress-kegiatan');
                },
              ),
              ListTile(
                title: Text('Kegiatan Eksternal'),
                onTap: () {
                  Navigator.pushNamed(context, '/kegiatan-eksternal');
                },
              ),
            ],
          ),
          ExpansionTile(
            leading: Icon(Icons.list, color: Color(0xFF11315F)),
            title: Text('Daftar Kegiatan'),
            children: <Widget>[
              ListTile(
                title: Text('Laporkan Progress Agenda'),
                onTap: () {
                  Navigator.pushNamed(context, '/laporkan-progress-agenda');
                },
              ),
              ListTile(
                title: Text('Detail Kegiatan'),
                onTap: () {
                  Navigator.pushNamed(context, '/detail-kegiatan');
                },
              ),
            ],
          ),
          ListTile(
            leading: Icon(Icons.bar_chart, color: Color(0xFF11315F)),
            title: Text('Statistik Kinerja'),
            onTap: () {
              Navigator.pushNamed(context, '/statistik-kinerja');
            },
          ),
          ListTile(
            leading: Icon(Icons.file_download, color: Color(0xFF11315F)),
            title: Text('Dokumen Draft Surat Tugas'),
            onTap: () {
              Navigator.pushNamed(context, '/dokumen-surat-tugas');
            },
          ),
          ListTile(
            leading: Icon(Icons.upload_file, color: Color(0xFF11315F)), // Ikon untuk unggah
            title: Text('Unggah Surat Tugas'), // Judul untuk unggah draft
            onTap: () {
              // Arahkan ke halaman unggah draft surat tugas
              Navigator.pushNamed(context, '/unggah-draft-surat-tugas');
            },
          ),
          ListTile(
            leading: Icon(Icons.person, color: Color(0xFF11315F)),
            title: Text('Pengaturan Profil'),
            onTap: () {
              Navigator.pushNamed(context, '/pengaturan-profil');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout, color: Color(0xFF11315F)),
            title: Text('Logout'),
            onTap: () {
              // Mengarahkan pengguna kembali ke halaman login
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}