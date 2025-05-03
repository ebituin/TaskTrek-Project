import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:tasktrek/pages/progress.dart';
import 'package:tasktrek/widgets/styles.dart';
import 'SpherePage.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class DatabaseHelper {
  static Database? _database; // Singleton pattern
  static const String _dbName = "app_db.db"; // Database name
  static const int _dbVersion = 1; // Database version

  // Table and columns
  static const String _tableName = 'students';
  static const String columnId = 'id';
  static const String columnName = 'name';
  static const String columnEmail = 'email';
  static const String columnPassword = 'password';

  // Open the database
  static Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDatabase();
      return _database!;
    }
  }

  // Initialize the database
  static Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), _dbName);
    return await openDatabase(
      path,
      version: _dbVersion,
      onCreate: (db, version) async {
        // Create the table when the database is created
        await db.execute('''
          CREATE TABLE $_tableName (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnName TEXT NOT NULL,
            $columnEmail TEXT NOT NULL,
            $columnPassword TEXT NOT NULL
          )
        ''');
      },
    );
  }

  // Insert a new user into the database
  static Future<void> insertUser(
    String name,
    String email,
    String password,
  ) async {
    final db = await database; // Get the database instance

    // Prepare the user data to insert
    Map<String, dynamic> user = {
      columnName: name,
      columnEmail: email,
      columnPassword: password,
    };

    // Insert the user data into the table
    await db.insert(
      _tableName, // Table name
      user, // Data to insert
      conflictAlgorithm: ConflictAlgorithm.replace, // Handle conflict if needed
    );
  }
}

void addUser() async {
  // Example: Adding a user with name and email
  await DatabaseHelper.insertUser(
    'John Doe',
    'johndoe@example.com',
    'user@user.com',
  );
  print('User added!');
}

class _DashboardState extends State<Dashboard> {

  int _selectedPage = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF018F81),
      appBar: AppBar(
        backgroundColor: const Color(0xFF018F81),
        title: const Text(
          'TASKTREK',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(child: Text('User')),
            ListTile(leading: Icon(Icons.dashboard), title: Text('Dashboard')),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        onTap: (value) {
          setState(() {
            _selectedPage = value;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Sphere',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline),
            label: 'In-Progress',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
        backgroundColor: AppColors.primaryColor,
        selectedItemColor: AppColors.accentColor,
        unselectedItemColor: const Color.fromARGB(127, 5, 10, 53),
      ),
      body: _getSelectedPage(_selectedPage)
    );
  }
  
  Widget _getSelectedPage(int index) {
  switch (index) {
    case 0:
      return SpherePage();
    case 1:
      return Progress();
    default:
      return SpherePage();
  }
}
}

