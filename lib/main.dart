import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shappitest/ui/views/character_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shappi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProviderScope(
        child: CharactersListView(),
      ),
    );
  }
}
