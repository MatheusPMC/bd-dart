import 'package:sqljocky5/sqljocky.dart';
import 'package:sqljocky5/results/results.dart';
import 'package:sqljocky5/connection/connection.dart';
import 'package:bdproj/bd.dart' as bd;

main() async {

  var conn = await bd.createConnection();

  //await createTable(conn);
  //await insertData(conn);
  await updateData(conn);
  await listData(conn);
  await removeData(conn);
  await dropTable(conn);
  //await conn.close();
}

Future<void> dropTable(MySqlConnection conn) async {
  print('\n\nRemovendo tabela...');
  await conn.execute('DROP TABLE people');
}

Future<void> removeData(MySqlConnection conn) async {
  print('\n\nRemovendo dados...');
  await conn.execute('DELETE from people');
}

Future<void> updateData(MySqlConnection conn) async {
  print('\n\nAtualizando dados...');
  await conn.prepared('UPDATE people SET name = ? where id = ?', ['Math', 1]);
}

Future<void> listData(MySqlConnection conn) async {
  print('Listando dados');

  StreamedResults results = await conn.execute('SELECT * FROM people');
  results.forEach((Row row) => print('ID: ${row[0]}, Nome: ${row[1]}, Idade: ${row[2]}, Email: ${row[3]},'));
}

Future<void> insertData(MySqlConnection conn) async {
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
