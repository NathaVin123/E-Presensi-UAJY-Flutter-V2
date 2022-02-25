import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:presensiblebeacon/UI/Dosen/Presensi/Detail/TampilPesertaKelas/DosenTampilKehadiranPesertaKelasPage copy.dart'
    as TampilHadir;
import 'package:presensiblebeacon/UI/Dosen/Presensi/Detail/TampilPesertaKelas/DosenTampilKehadiranPesertaKelasPage.dart'
    as TampilTidakHadir;

class TampilPresensiAppBar extends StatefulWidget {
  TampilPresensiAppBar({Key key}) : super(key: key);

  @override
  State<TampilPresensiAppBar> createState() => _TampilPresensiAppBarState();
}

class _TampilPresensiAppBarState extends State<TampilPresensiAppBar> {
  int index = 0;

  final screens = [
    TampilHadir.DosenTampilKehadiranPesertaKelasPageTes(),
    TampilTidakHadir.DosenTampilKehadiranPesertaKelasPage(),
  ];

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        child: NavigationBarTheme(
          data: NavigationBarThemeData(
              indicatorColor: Colors.blue[200],
              labelTextStyle: MaterialStateProperty.all(TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans'))),
          child: NavigationBar(
            height: 65,
            backgroundColor: Colors.blue[100],
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            selectedIndex: index,
            animationDuration: Duration(seconds: 1),
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            destinations: [
              NavigationDestination(
                  icon: Icon(Icons.check_outlined),
                  selectedIcon: Icon(
                    Icons.check_outlined,
                    color: Colors.green,
                  ),
                  label: 'Hadir'),
              NavigationDestination(
                label: 'Tidak Hadir',
                icon: Icon(Icons.cancel_outlined),
                selectedIcon: Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
