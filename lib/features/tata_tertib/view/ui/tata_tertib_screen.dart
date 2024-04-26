// tata_tertib_view.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../dashboard/view/ui/dashboard_screen.dart';

class TataTertib extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tata Tertib'),
      ),
      body: Center(
        child: Text('This is the Tata Tertib page'),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 15,
              offset: Offset(0, -1),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          child: BottomNavigationBar(
            currentIndex: 1,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              if (index != 1) {
                Get.offAll(() => DashboardScreen());
              }
            },
            selectedItemColor: Colors.purple,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shield_outlined),
                label: 'Tata Tertib',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.payment_outlined),
                label: 'Iuran Warga',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_tree_outlined),
                label: 'Struktur RT',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
