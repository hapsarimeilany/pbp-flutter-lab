import 'package:flutter/material.dart';
import 'package:counter_7/drawer.dart';
import 'package:counter_7/budget.dart';

class BudgetFormPage extends StatefulWidget {
  const BudgetFormPage({super.key});

  @override
  State<BudgetFormPage> createState() => _BudgetFormPageState();
}

class _BudgetFormPageState extends State<BudgetFormPage> {

    final _formKey = GlobalKey<FormState>();
    final _controllerJudul = TextEditingController();
    final _controllerNominal = TextEditingController();
    String _judul = "";
    int _nominal = 0;
    String _jenis = 'Pemasukan';

    // Dipanggil saat tombol "Simpan" diklik (reset form)
    void clearText() {
        _judul = "";
        _nominal = 0;
    }
    
    // Untuk cek apakah nominal berupa angka
    bool isNumeric(String value){
        return int.tryParse(value) != null;
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Form Budget'),
            ),
            drawer: buildDrawer(context),
            
            // Form
            body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                    child: Container(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                            children: [

                                Padding(
                                    // Menggunakan padding sebesar 8 pixels
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                        decoration: InputDecoration(
                                            hintText: "Contoh: Beli sate pacil",
                                            labelText: "Judul",
                                            // // Menambahkan icon agar lebih intuitif
                                            icon: const Icon(Icons.edit_note),
                                            // Menambahkan circular border agar lebih rapi
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(5.0),
                                            ),
                                        ),
                                        // Menambahkan behavior saat judul diketik
                                        onChanged: (String? value) {
                                            setState(() {
                                                _judul = value!;
                                            });
                                        },
                                        // Menambahkan behavior saat data disimpan
                                        onSaved: (String? value) {
                                            setState(() {
                                                _judul = value!;
                                            });
                                        },
                                        // Validator form
                                        validator: (String? value) {
                                            if (value == null || value.isEmpty) {
                                                return 'Judul budget tidak boleh kosong!';
                                            }
                                            return null;
                                        },
                                    ),
                                ),

                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                        decoration: InputDecoration(
                                            hintText: "Contoh: 10000",
                                            labelText: "Nominal",
                                            icon: const Icon(Icons.monetization_on_outlined),
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(5.0),
                                            ),
                                        ),

                                        keyboardType: TextInputType.number,

                                        // Menambahkan behavior saat nominal diketik 
                                        onChanged: (String? value) {
                                            setState(() {
                                                _nominal = int.parse(value!);
                                            });
                                        },
                                        // Menambahkan behavior saat data disimpan
                                        onSaved: (String? value) {
                                            setState(() {
                                                _nominal = value! as int;
                                            });
                                        },
                                        // Validator
                                        validator: (String? value) {

                                            // Jika nominal tidak diisi
                                            if (value == null || value.isEmpty) {
                                                return 'Nominal budget tidak boleh kosong!';
                                            }
                                            // Jika nominal bukan berupa angka
                                            if (!isNumeric(value)) {
                                                return 'Nominal budget harus berupa angka!';
                                            }
                                            return null;
                                        },
                                    ),
                                ),


                                // Buat Dropdown
                                ListTile(
                                    leading: const Icon(Icons.class_),
                                    title: const Text(
                                        'Pilih Jenis ',
                                    ),
                                    trailing: DropdownButton(
                                        value: _jenis,
                                        icon: const Icon(Icons.keyboard_arrow_down),
                                        items: const <DropdownMenuItem<String>>[
                                        DropdownMenuItem<String>(
                                            value: 'Pengeluaran',
                                            child: Text('Pengeluaran'),
                                        ),
                                        DropdownMenuItem<String>(
                                            value: 'Pemasukan',
                                            child: Text('Pemasukan'),
                                        ),
                                        ],
                                        // Simpan jenis yang dipilih
                                        onChanged: (String? newValue) {
                                            setState(() {
                                                _jenis = newValue!;
                                            });
                                        },
                                    ),
                                ),

                                // Tombol "Simpan"
                                TextButton(
                                    style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                                    ),
                                    onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                            inputDataBudget(_judul, _nominal, _jenis);
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => const BudgetFormPage()),
                                            );
                                            clearText();
                                        }
                                    },
                                    child: const Text(
                                        "Simpan",
                                        style: TextStyle(color: Colors.white, fontSize: 15),
                                    ),
                                ),
                            ],
                        ),
                    ),
                ),
            ),
        );
    }
}