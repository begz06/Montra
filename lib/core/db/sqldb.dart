import 'package:dartz/dartz.dart';
import 'package:montra_app_a1/modules/home/data/model/transaction_model.dart';
import 'package:montra_app_a1/utils/failures.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static final DatabaseService _databaseService = DatabaseService._internal();

  factory DatabaseService() => _databaseService;

  DatabaseService._internal();

  static String transactionsTableKey = 'recentTransaction';

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    // Initialize the DB first time it is accessed
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'transactionDb2.db');
    return await openDatabase(
      path,
      onCreate: _onCreate,
      version: 3,
      onConfigure: (db) async => await db.execute('PRAGMA foreign_keys = ON'),
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE $transactionsTableKey(id INTEGER PRIMARY KEY, name TEXT, description TEXT,color_hex TEXT,icon_path TEXT, isExpense INTEGER, type TEXT, price INTEGER,date DATETIME  , image TEXT)',
    );
  }

  Future<void> insertTransaction(TransactionModel transaction) async {
    final db = await _databaseService.database;

    await db.insert(
      transactionsTableKey,
      transaction.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<Either<Failure, List<TransactionModel>>> getTransactions() async {
    try {
      final db = await _databaseService.database;

      var maps = await db.query(transactionsTableKey);

      var list = maps.map((e) => TransactionModel.fromJson(e)).toList();

      return right(list);
    } catch (e) {
      return left(LocalDbFailure(message: e.toString()));
    }
  }

  Future<TransactionModel> getTransaction(int id) async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps =
        await db.query(transactionsTableKey, where: 'id = ?', whereArgs: [id]);
    return TransactionModel.fromJson(maps[0]);
  }

  Future<void> updateTransaction(SubTransaction transaction) async {
    final db = await _databaseService.database;

    await db.update(
      transactionsTableKey,
      transaction.toJson(),
      where: 'id = ?',
      whereArgs: [transaction.id],
    );
  }

  Future<void> deleteTransaction(int id) async {
    final db = await _databaseService.database;

    await db.delete(
      transactionsTableKey,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
