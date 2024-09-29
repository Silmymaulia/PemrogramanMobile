import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF00244A), // Warna biru navy
        elevation: 0,
        title: Row(
          children: [
            Image.asset(
              'assets/logo.png', // Ganti dengan path logo Anda
              height: 40,
            ),
            SizedBox(width: 10),
            Text(
              'Sistem Manajemen Sumber Daya Manusia\nJurusan Teknologi Informasi\nPoliteknik Negeri Malang',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                      'assets/profile_picture.png', // Ganti dengan path foto profil Anda
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          // Aksi tombol Edit
                        },
                        child: Text(
                          'Edit',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                      Text('|'),
                      TextButton(
                        onPressed: () {
                          // Aksi tombol Hapus
                        },
                        child: Text(
                          'Hapus',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ProfileItem(title: 'Nama', value: 'Zefanya Tiomora'),
            ProfileItem(title: 'NIP', value: '56887644467754'),
            ProfileItem(title: 'Role', value: 'Dosen'),
            ProfileItem(title: 'Keahlian', value: 'Pendidikan'),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Aksi tombol Keluar
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300], // Warna background tombol
                  foregroundColor: Colors.black, // Warna teks tombol
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('Keluar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  final String title;
  final String value;

  ProfileItem({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
