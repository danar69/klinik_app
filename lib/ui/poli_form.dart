import 'package:flutter/material.dart';
import 'package:klinik_app/model/poli.dart';
import 'package:klinik_app/service/poli_service.dart';

import 'package:klinik_app/ui/poli_page.dart';

class PoliForm extends StatefulWidget {
  const PoliForm({super.key});

  @override
  _PoliFormState createState() => _PoliFormState();
}

class _PoliFormState extends State<PoliForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaPoliCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Poli")),
      body: SingleChildScrollView(
        key: _formKey,
        child: Form(
            child: Column(
          children: [
            _fieldNamaPoli(),
            const SizedBox(height: 20),
            _tombolSimpan(),
          ],
        )),
      ),
    );
  }

  _fieldNamaPoli() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Poli"),
      controller: _namaPoliCtrl,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
        onPressed: () async {
          Poli poli = Poli(namaPoli: _namaPoliCtrl.text);
          await PoliService().simpan(poli).then((value) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => PoliPage()));
          });
        },
        child: const Text("Simpan"));
  }
}
