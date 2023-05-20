
import 'package:csv_file/csv_functions.dart';
import 'package:csv_file/widget/widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("CSV",
            style: TextStyle(
              fontSize: 25,
            )),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (getCsvFile == null)
            ShowData(
              onPressed: () async {
                getCsvFile = await getcsv(context);
                setState(() {});
              },
            ),
          if (getCsvFile != null)
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const[
   Text(
                      'press to show  data in console',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
                Botton(
                  onPressed: () async {
                    await firstFile();

                    await secondFile();

                    setState(() {});
                  },
                  text: 'Show data',
                ),
              ],
            ),
        ],
      ),
    );
  }
}