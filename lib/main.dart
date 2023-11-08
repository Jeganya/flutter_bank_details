import 'package:flutter/material.dart';
import 'package:flutter_bank_details_jeganya/bank_details_list_screen.dart';
import 'package:flutter_bank_details_jeganya/database_helper.dart';

final dbHelper = DatabaseHelper();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dbHelper.initialization();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BankDetailsListScreen(),
    );
  }
}
