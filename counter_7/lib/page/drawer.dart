import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/page/form.dart';
import 'package:counter_7/page/budget.dart';
import 'package:counter_7/page/mywatchlist.dart';

Drawer buildDrawer(BuildContext context) {
  return Drawer(
    child: Column(
      children: [
        // Menambahkan clickable menu ke navigator drawer
        ListTile(
          title: const Text('counter_7'),
          onTap: () {
            // Mengarah ke homepage
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage()),
            );
          },
        ),
        ListTile(
          title: const Text('Tambah Budget'),
          onTap: () {
            // Mengarah ke 'Tambah Budget' page
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const BudgetFormPage()),
            );
          },
        ),
        ListTile(
          title: const Text('Data Budget'),
          onTap: () {
            // Mengarah ke 'Data Budget' page
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const DataBudgetPage()),
            );
          },
        ),
        ListTile(
          title: const Text('My Watch List'),
          onTap: () {
            // Route menu ke halaman My Watchlist
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MyWatchListPage()),
            );
          },
        ),
      ],
    ),
  );
}