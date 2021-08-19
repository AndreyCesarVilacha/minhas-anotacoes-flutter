import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

//Singleton para manipular o banco de dados
class AnotacaoHelper{
  static final AnotacaoHelper _anotacaoHelper = AnotacaoHelper.internal();
  //Criando a instância do banco de dado
  Database? _db;

  factory AnotacaoHelper(){
    return _anotacaoHelper;
  }

  AnotacaoHelper.internal();

  get db async {
    if(_db != null){
      return _db;
    } else{

    }
  }

  _onCreate(Database db, int version) async {

    String sql = "CREATE TABLE anotacao (id INTEGER PRIMARY KEY AUTOIMCREMENT, titulo VARCHAR, descricao TEXT, data DATETIME)";
    await db.execute(sql);

  }

  inicializarDB() async {
    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(caminhoBancoDados, "banco_minhas_anotacoes.db");

    var db = await openDatabase(localBancoDados, version: 1, onCreate: _onCreate);

    return db;

  }

}