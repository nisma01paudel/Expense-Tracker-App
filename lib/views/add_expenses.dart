import 'dart:math';

import 'package:expenses_tracker/controllers/controller.dart';
import 'package:expenses_tracker/data.dart';
import 'package:expenses_tracker/models/expenses.dart';
import 'package:flutter/material.dart';

class AddExpenses extends StatefulWidget {
  const AddExpenses({super.key});

  @override
  State<AddExpenses> createState() => _AddExpensesState();
}

class _AddExpensesState extends State<AddExpenses> {
 final _formKey = GlobalKey<FormState>();

  // TODO: Add All Controller
  final _idController = TextEditingController();
  final _categoryController = TextEditingController();
  final _amountController = TextEditingController();
  final _dateController = TextEditingController();
  final _remarksController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Expenses'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _categoryController,
                decoration: const InputDecoration(
                  labelText: 'Category',
                  hintText: 'Enter Category',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter category';
                  } 
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _amountController,
                decoration: const InputDecoration(
                  labelText: 'Amount',
                  hintText: 'Enter your amount',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter amount';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              // ElevatedButton(
              //   onPressed: () {
              //     if (_formKey.currentState!.validate()) {
              //       ScaffoldMessenger.of(context).showSnackBar(
              //         const SnackBar(content: Text('Add Expenses Successful!')),
              //       );
              //       // Here you would typically handle the form submission,
              //       // like sending the data to a server or saving it locally.
              //     }
              //   },
              //   child: const Text(''),
              // ),
              const SizedBox(height: 10),

              TextFormField(
                controller: _dateController,
                decoration: const InputDecoration(
                  labelText: 'Date',
                  hintText: 'Enter date',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please fill your date';
                  } 
                  return null;
                },

              ),
              const SizedBox(height: 10),

              TextFormField(
                controller: _remarksController,
                decoration: const InputDecoration(
                  labelText: ' Remarks',
                  hintText: 'Enter remarks',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Remarks must be field';
                  } 
                  return null;
                },

              ),
               const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  style:ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  );
                  if (_formKey.currentState!.validate()) {
                    print("Category is ${_categoryController.text}");
                    print("Amount is ${_amountController.text}");
                    print("Date is ${_dateController.text}");
                    print("Remakrs is ${_remarksController.text}");

                    int randomNo = 1 + Random().nextInt((10000000 + 1) - 1);
                    Expenses currentExpenses = Expenses(randomNo, _categoryController.text, double.parse( _amountController.text), _dateController.text, _remarksController.text);
                   

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Add Expenses Successful!')),
                    );



                    Navigator.pop(context, currentExpenses);
                    // Here you would typically handle the form submission,
                    // like sending the data to a server or saving it locally.
                  }
                   
                },
                
                
                child: const Text('Add expenses'),
              ),

            ],
            // ElevatedButton(
              //   onPressed: () {
              //     if (_formKey.currentState!.validate()) {
              //       ScaffoldMessenger.of(context).showSnackBar(
              //         const SnackBar(content: Text('Add Expenses Successful!')),
              //       );
              //       // Here you would typically handle the form submission,
              //       // like sending the data to a server or saving it locally.
              //     }
              //   },
              //   child: const Text(''),
              // ),
          ),
        ),
      ),
    );
  }
}