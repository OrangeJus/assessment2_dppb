import 'package:flutter/material.dart';
import 'secondPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Assessment 2")),
        body: SingleChildScrollView(
          child: const MyForm(),
        ),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controllerBarang = TextEditingController();
    final controllerDeskripsi = TextEditingController();
    final controllerHarga = TextEditingController();
    String? kondisi;
    bool kondisiBekas = false;
    bool kondisiBaru = false;
    final controllerDalamKota = TextEditingController();
    final controllerRetur = TextEditingController();

    return Form(
      key: _formKey,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: TextFormField(
                style: TextStyle(fontSize: 15),
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide(width: 2)),
                  labelText: 'Nama barang',
                ),
                controller: controllerBarang,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: TextFormField(
                maxLines: 4,
                style: TextStyle(fontSize: 15),
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide(width: 2)),
                  labelText: 'Deskripsi',
                ),
                controller: controllerDeskripsi,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: TextFormField(
                style: TextStyle(fontSize: 15),
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide(width: 2)),
                  labelText: 'Harga',
                ),
                controller: controllerHarga,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
            Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Kondisi Barang",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                )),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  RadioListTile(
                    title: Text('Bekas', style: TextStyle(fontSize: 15)),
                    value: 'Bekas',
                    groupValue: kondisi,
                    onChanged: (value) {
                      setState(() {
                        kondisi = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text('Baru', style: TextStyle(fontSize: 15)),
                    value: 'Baru',
                    groupValue: kondisi,
                    onChanged: (value) {
                      setState(() {
                        kondisi = value.toString();
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: CheckboxListTile(
                title: Text('Pengiriman dalam kota saja'),
                value: kondisiBekas,
                onChanged: (bool? value) {
                  setState(() {
                    kondisiBekas = value ?? false;
                  });
                },
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: CheckboxListTile(
                title: Text('Menerima retur'),
                value: kondisiBekas,
                onChanged: (bool? value) {
                  setState(() {
                    kondisiBekas = value ?? false;
                  });
                },
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: myBtn(context),
            ),
          ],
        ),
      ),
    );
  }
}

OutlinedButton myBtn(BuildContext context) {
  return OutlinedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return const Details();
          }),
        );
      },
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(Size(340, 50)),
      ),
      child: Text(
        "PUBLIKASIKAN".toUpperCase(),
        style: const TextStyle(fontWeight: FontWeight.bold),
      ));
}
