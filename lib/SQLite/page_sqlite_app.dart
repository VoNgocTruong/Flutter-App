import 'package:flutter/material.dart';
import 'package:flutter_ngoctruong/SQLite/page_list_users.dart';
import 'package:flutter_ngoctruong/SQLite/provider_data.dart';
import 'package:provider/provider.dart';

class SQLiteApp extends StatefulWidget {
  const SQLiteApp({Key? key}) : super(key: key);

  @override
  State<SQLiteApp> createState() => _SQLiteAppState();
}

class _SQLiteAppState extends State<SQLiteApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        var databaseProvider = DatabaseProvider();
        databaseProvider.readUsers();
        return databaseProvider;
      },
      child: MaterialApp(
        title: 'SQLite Demo App',
        home: PageListUserSQLite(),
      ),
    );
  }
}
