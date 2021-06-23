import 'dart:io';
import './widgets/header.dart';
import 'package:flutter/services.dart';
import './widgets/new_transaction.dart';
import './widgets/transactions_list.dart';
import 'package:flutter/material.dart';
import 'models/transaction.dart';
import './widgets/chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Map<int, Color> color = {
    50: Color.fromARGB(255, 254, 230, 152),
    100: Color.fromARGB(255, 254, 230, 152),
    200: Color.fromARGB(255, 254, 230, 152),
    300: Color.fromARGB(255, 254, 230, 152),
    400: Color.fromARGB(255, 254, 230, 152),
    500: Color.fromARGB(255, 254, 230, 152),
    600: Color.fromARGB(255, 254, 230, 152),
    700: Color.fromARGB(255, 254, 230, 152),
    800: Color.fromARGB(255, 254, 230, 152),
    900: Color.fromARGB(255, 254, 230, 152),
  };

  @override
  Widget build(BuildContext context) {
    MaterialColor colorPrimarySwatch = MaterialColor(0xff212121, color);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Manager',
      theme: ThemeData(
          primarySwatch: colorPrimarySwatch,
          accentColor: Color.fromARGB(255, 254, 230, 152),
          textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                      headline6: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ))),
          fontFamily: 'Quicksand'),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // String titleInput;
  // String amountInput;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: 't1',
    //   title: 'Shirt',
    //   amount: 1000,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'Trousers',
    //   amount: 1900,
    //   date: DateTime.now(),
    // ),
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: chosenDate);

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: NewTransaction(_addNewTransaction),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 33, 33, 33),
    ));
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 33, 33, 33),
/*       appBar: AppBar(
          title: Text(
            'Expense Manager',
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _startAddNewTransaction(context),
            )
          ],
        ), */
        body: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.126,
                child: Header(),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.22,
                child: Chart(_recentTransactions),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.654,
                child: TransactionList(_userTransactions, _deleteTransaction),
              ),
            ],
          ),
        ),
        floatingActionButton: Platform.isIOS ? Container() : FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _startAddNewTransaction(context),
        ),
      ),
    );
  }
}
