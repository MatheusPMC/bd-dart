import 'package:sqljocky5/sqljocky.dart';
import 'package:sqljocky5/connection/connection.dart';
import 'package:bdproj/bd.dart' as bd;

main() async {

  var conn = await bd.createConnection();

  await createTable(conn);
  await inserData(conn);
  //await conn.close();
}

Future<void> inserData(MySqlConnection conn) async {
  print('Inserindo dados...');

  var data = [
    ['Matheus', 'matheus.pmc@hotmail.com', 29],
    ['Mury', 'murykanehira@gmail.com', 21]
  ];

  await conn.preparedWithAll("INSERT INTO people (name, email, age) VALUES (?, ?, ?)", data);
  print('Dados inseridos com sucesso!');
}

Future<void> createTable(MySqlConnection conn) async {
  print('Criando tabela...');
  await conn.execute('CREATE TABLE IF NOT EXISTS people(id INTEGER NOT NULL auto_increment, name VARCHAR(255), age INTEGER, email VARCHAR(255), PRIMARY KEY(ID))');
  print('Tabela criada com sucesso!');
}
