import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class LaporkanProgressAgenda2Page extends StatefulWidget {
  final String kegiatan;

  LaporkanProgressAgenda2Page({required this.kegiatan});

  @override
  _LaporkanProgressAgendaPageState createState() => _LaporkanProgressAgendaPageState();
}

class _LaporkanProgressAgendaPageState extends State<LaporkanProgressAgenda2Page> {
  List<Agenda> agendas = [
    Agenda(name: 'Persiapan Dokumen Akreditasi (1-5 Oktober 2024)'),
    Agenda(name: 'Pengumpulan Data (6-10 Oktober 2024)'),
    Agenda(name: 'Presentasi Akreditasi (11-15 Oktober 2024)'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Laporkan Progress',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF11315F),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: Colors.grey[100],
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kegiatan: ${widget.kegiatan}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF11315F)),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: agendas.length,
                itemBuilder: (context, index) {
                  return AgendaProgressInput(agenda: agendas[index]);
                },
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Sukses'),
                        content: Text('Laporan agenda telah berhasil terkirim!'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Oke'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Laporkan Semua Agenda'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF11315F),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Agenda {
  final String name;
  String? progress;
  String? keterangan;
  String? filePath;

  Agenda({required this.name});
}

class AgendaProgressInput extends StatefulWidget {
  final Agenda agenda;

  AgendaProgressInput({required this.agenda});

  @override
  _AgendaProgressInputState createState() => _AgendaProgressInputState();
}

class _AgendaProgressInputState extends State<AgendaProgressInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            enabled: false,
            decoration: InputDecoration(
              labelText: 'Nama Agenda',
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.grey[200],
            ),
            controller: TextEditingController(text: widget.agenda.name),
          ),
          SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(labelText: 'Progress (%)'),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              widget.agenda.progress = value;
            },
          ),
          SizedBox(height: 8),
          TextField(
            maxLines: 3,
            decoration: InputDecoration(labelText: 'Keterangan'),
            onChanged: (value) {
              widget.agenda.keterangan = value;
            },
          ),
          SizedBox(height: 8),
          ElevatedButton.icon(
            onPressed: () async {
              String? result = await FilePicker.platform.pickFiles().then((result) {
                if (result != null) {
                  setState(() {
                    widget.agenda.filePath = result.files.single.path;
                  });
                  return widget.agenda.filePath;
                }
                return null;
              });
              if (result != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Berkas ${widget.agenda.filePath} berhasil dipilih')),
                );
              }
            },
            icon: Icon(Icons.upload_file),
            label: Text('Unggah Berkas'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF11315F),
              foregroundColor: Colors.white,
            ),
          ),
          if (widget.agenda.filePath != null)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text('Berkas yang di-upload: ${widget.agenda.filePath!.split('/').last}'),
            ),
        ],
      ),
    );
  }
}