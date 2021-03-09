import 'package:sqljocky5/sqljocky.dart';

createConnection() async {

    var s = ConnectionSettings(
    user: "root",
    password: "as123456",
    host: "localhost",
    port: 3306,
    db: "dart",
  );

    return await MySqlConnection.connect(s);
}