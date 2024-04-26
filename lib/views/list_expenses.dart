import 'package:expenses_tracker/data.dart';
import 'package:expenses_tracker/views/add_expenses.dart';
import 'package:flutter/material.dart';

import '../models/expenses.dart';

class ListScreen extends StatefulWidget {
  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<Expenses> allExpenses = [
 
];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('List Expenses'),
          backgroundColor: Colors.green[300],
        ),
        body: allExpenses.length == 0? Center(
          child: Text("No Item Available"),
        ):  ListView.builder(
            itemCount: allExpenses.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  child: Text((index + 1).toString()),
                ),
                title: Text(allExpenses[index].category),
                subtitle: Text(
                    'Amount: ${allExpenses[index].amount}, Date: ${allExpenses[index].date}, Remarks: ${allExpenses[index].remarks}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.delete),
                      color: Colors.red,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.edit),
                      color: Colors.blue,
                    ),
                  ],
                ),
              );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () async{
           final expenses = await Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AddExpenses()),
                );
                if (expenses != null) {
                  setState(() {
                    allExpenses.add(expenses);
                  });
                }
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
