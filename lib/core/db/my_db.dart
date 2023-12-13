import 'package:montra_app_a1/modules/home/data/model/transaction.dart';
import 'package:montra_app_a1/utils/either.dart';
import 'package:montra_app_a1/utils/failures.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  // Singleton pattern
  static final DatabaseService _databaseService = DatabaseService._internal();

  factory DatabaseService() => _databaseService;

  DatabaseService._internal();

  static String transactionsTableKey = 'recentTransaction';
  static String subTransactionsTableKey = 'subTransaction';

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
    // Run the CREATE {breeds} TABLE statement on the database.
    await db.execute(
      'CREATE TABLE $transactionsTableKey(id SERIAL PRIMARY KEY, name TEXT, description TEXT,type TEXT, price INTEGER,date1 TEXT,image TEXT )',
    );
    await db.execute(
      'CREATE TABLE $subTransactionsTableKey(id SERIAL PRIMARY KEY , name TEXT, description TEXT, price INTEGER,date TEXT,image TEXT, transactionId INTEGER)',
    );
    // Run the CREATE {dogs} TABLE statement on the database.
    // await db.execute(
    //   'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER, color INTEGER, breedId INTEGER, FOREIGN KEY (breedId) REFERENCES breeds(id) ON DELETE SET NULL)',
    // );
  }

  // Define a function that inserts breeds into the database
  Future<void> insertTransaction(TransactionModel transaction) async {
    // Get a reference to the database.
    final db = await _databaseService.database;

    // Insert the Breed into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same breed is inserted twice.
    //
    // In this case, replace any previous data.
    var item = await db.insert(
      transactionsTableKey,
      transaction.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    for (var element in transaction.subtransactions) {
      await db.insert(
        subTransactionsTableKey,
        element.toJson(id: item),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  // A method that retrieves all the breeds from the breeds table.
  Future<Either<Failure, List<TransactionModel>>> getTransactions() async {
    try {
      final db = await _databaseService.database;

      var maps = await db.query(transactionsTableKey);

      var list = maps.map((e) => TransactionModel.fromJson(e)).toList();

      for (var i in list) {
        var items = await db.query(subTransactionsTableKey,
            where: 'transactionId=?', whereArgs: [i.id]);
        i.subtransactions =
            items.map((e) => SubTransaction.fromJson(e)).toList();
      }
      print(list.length.toString() + ' db141Success');
      return Right(list);
    } catch (e) {
      print(e.toString() + ' db141Error');
      return Left(LocalDbFailure(message: e.toString()));
    }
    // Get a reference to the database.
  }

  Future<TransactionModel> getTransaction(int id) async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps =
        await db.query(transactionsTableKey, where: 'id = ?', whereArgs: [id]);
    return TransactionModel.fromJson(maps[0]);
  }

  // A method that updates a breed data from the breeds table.
  Future<void> updateTransaction(SubTransaction transaction) async {
    // Get a reference to the database.
    final db = await _databaseService.database;

    // Update the given breed
    await db.update(
      transactionsTableKey,
      transaction.toJson(),
      // Ensure that the Breed has a matching id.
      where: 'id = ?',
      // Pass the Breed's id as a whereArg to prevent SQL injection.
      whereArgs: [transaction.id],
    );
  }

  // A method that deletes a breed data from the breeds table.
  Future<void> deleteTransaction(int id) async {
    // Get a reference to the database.
    final db = await _databaseService.database;

    // Remove the Breed from the database.
    await db.delete(
      transactionsTableKey,
      // Use a `where` clause to delete a specific breed.
      where: 'id = ?',
      // Pass the Breed's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }
}
