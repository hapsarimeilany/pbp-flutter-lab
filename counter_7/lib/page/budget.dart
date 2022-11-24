import 'package:flutter/material.dart';
import 'package:counter_7/page/drawer.dart';

class DataBudgetPage extends StatefulWidget {
    const DataBudgetPage({super.key});

    @override
    State<DataBudgetPage> createState() => _DataBudgetPageState();
}

class _DataBudgetPageState extends State<DataBudgetPage> {

    // Daftar-daftar data yang disimpan
    static List<String> daftarJudul = [];
    static List<int> daftarNominal = [];
    static List<String> daftarJenis = [];

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Data Budget'),
            ),

            drawer: buildDrawer(context),

            body:ListView.builder(
                itemBuilder: (context, index) {
                    return Card(
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                                children:[

                                    Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                            daftarJudul[index], style: const TextStyle(fontSize: 25),
                                            textAlign: TextAlign.left),
                                        ),
                                    ),

                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                            Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Align(
                                                    alignment: Alignment.topLeft,
                                                    child: Text(daftarNominal[index].toString(), style: TextStyle(fontSize: 15),
                                                        textAlign: TextAlign.left),
                                                ),
                                            ),
                                            Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Align(
                                                    alignment: Alignment.topRight,
                                                    child: Text(daftarJenis[index], style: TextStyle(fontSize: 15),
                                                        textAlign: TextAlign.right),
                                                ),
                                            ),
                                        ]
                                    ),
                                ],
                            )
                        ),
                    );
                },
                itemCount: daftarJudul.length,
            ),
        );
    }
}

// memasukkan setiap data ke dalam array untuk ditampilkan
void inputDataBudget(String judul, int nominal, String jenis){ 
    _DataBudgetPageState.daftarJudul.add(judul);
    _DataBudgetPageState.daftarNominal.add(nominal);
    _DataBudgetPageState.daftarJenis.add(jenis);
}