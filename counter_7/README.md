# counter_7

A new Flutter project.
# README TUGAS 7 PBP

1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.

   Stateless widget adalah widget yang bersifat statis dimana seluruh konfigurasi yang dimuat didalamnya telah diinisiasi sejak awal. 
   Sedangkan stateful widget merupakan widget yang bersifat dinamis, sehingga widget ini dapat diperbaharui kapanpun dibutuhkan berdasarkan user actions atau ketika terjadinya perubahan data.
   
   Perbedaan dari stateless widget dan stateful widget terletak pada sifatnya yaitu stateless widget bersifat statis sedangkan stateful widget bersifat dinamis.
   Sehingga dalam penggunaannya, stateless widget tidak dapat diubah-ubah sedangkan stateful widget bisa.

2. Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
  - Tetx: Untuk membuat serangkaian teks dengan style tertentu
  - Row & Column: Membuat tata letak yang fleksibel dalam arah horizontal (row) maupun vertikal (column).
  - Scaffold: Mengatur struktur visual layout dengan mengimplementasikan material design
  - AppBar: Menu penunjuk atau widget yang dapat menampilkan beberapa navigasi dari aplikasi
  - FloattingActionButton: Tombol untuk memicu adanya action di halaman flutter
   
3. Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
    
   setState() berfungsi untuk memberi tahu framework bahwa terdapat object yang mengalami perubahan pada state, 
   kemudian akan dilakukan build ulang pada widget.

   Variabel yang dapat terdampak oleh fungsi setState adalah ......

4. Jelaskan perbedaan antara const dengan final.

   Final dan const merupakan keyword yang dapat digunakan dalam membuat variabel yang bersifat immutable. 
   Namun, terdapat perbedaan di antara keduanya. Perbedaan utama ada pada inialisasi nilai (pemberian nilai) dari variabelnya. 
   Const mengharuskan variabel dinialisasi pada saat kompilasi, nilai bersifat konstan dan ditulis secara langsung / eksplisit 
   sehingga pada saat kompilasi variabel const sudah memiliki nilai, sedangkan final tidak mengharuskan variabel memiliki nilai 
   secara langsung / eskplisit pada saat kompilasi.

5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.

- Membuat aplikasi flutter bernama ```counter_7``` dengan perintah ```flutter create counter_7``` yang terletak di dalam folder root bernama ```pbp-flutter-lab```
- Mengedit dan menambahkan beberapa bagian di dalam file ```main.dart``` yang terletak di dalam folder ```lib``` aplikasi. Bagian-bagian tersebut di antaranya:
    
    a. Mengubah title pada homepage menjadi "Program Counter"
    ```
    class MyApp extends StatelessWidget {
        const MyApp({super.key});

        // This widget is the root of your application.
        @override
        Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
            primarySwatch: Colors.blue,
            ),
            home: const MyHomePage(title: 'Program Counter'),
            );
        }
    }
    ```

    b. Membuat fungsi ```_decrementCounter()``` yang akan dipanggil ketika button ```-``` diklik
    ```
    void _decrementCounter() {
        setState(() {
        _counter--;
        });
  }
  ```
  c. Membuat widget berupa button ```+``` untuk meng-increment counter dan ```-``` untuk meng-decrement counter dalam suatu column di body dengan kondisi
  teks akan berubah menjadi "GENAP" dengan warna text merah saat counter bernilai genap 
  dan "GANJIL" dengan warna text biru saat counter bernilai ganjil
  ```
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            // Handle text GANJIL/GENAP
            _counter % 2 == 1
              ? const Text('GANJIL',
                style: TextStyle(color: Colors.blue),
              )
              : const Text('GENAP',
                style: TextStyle(color: Colors.red),
              ),
            Text(
            '$_counter',
            style: Theme.of(context).textTheme.headline4,
            ), 
          ], 
        ),
      ),
    ```

    d. Mengimplementasikan fungsionalitas button ```+``` dan ```-``` yang terletak dalam satu baris dengan memanfaatkan padding
    untuk mencegah button ```-``` terpotong
    ```
    // Membuat 2 button - dan + dalam 1 baris (row)
    // Padding dipakai agar button - tidak terpotong
    floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 35),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

                // Bonus
                Visibility(
                    visible: _counter > 0,
                    child: FloatingActionButton(
                    onPressed: _decrementCounter,
                    tooltip: 'Decrement',
                    child: const Icon(Icons.remove),
                )),

                FloatingActionButton(
                    onPressed: _incrementCounter,
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                ),

            ],
        ))
    ```

    e. Me-run program counter

REPOSITORY: https://github.com/hapsarimeilany/pbp-flutter-lab.git




## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
