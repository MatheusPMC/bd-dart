import 'package:sqljocky5/sqljocky.dart';
import 'package:bdproj/bd.dart' as bd;

main() async {

  var conn = await bd.createConnection();

  await createTable(conn);
  await conn.close();
}

Future<void> createTable(MySqlConnection conn) async {
  print('Criando tabela...');
  await conn.execute('CREATE TABLE IF NOT EXISTS people(id INTEGER NOT NULL auto_increment, name VARCHAR(255), age INTEGER, email VARCHAR(255), PRIMARY KEY(ID))');
  print('Tabela criada com sucesso!');
}
