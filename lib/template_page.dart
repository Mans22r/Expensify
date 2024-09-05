// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'home_page.dart';

class TemplatePage extends StatefulWidget {
  const TemplatePage({super.key});

  @override
  _TemplatePageState createState() => _TemplatePageState();
}

class _TemplatePageState extends State<TemplatePage> {
  String selectedCategory = 'Groceries'; 
  String selectedPaymentMethod = 'Physical Cash';
  String selectedCurrency = 'INR (₹)';

  final List<Map<String, dynamic>> categories = [
    {'name': 'Groceries', 'icon': Icons.shopping_cart, 'color': const Color.fromRGBO(97, 216, 216, 1)},
    {'name': 'Apparels', 'icon': Icons.checkroom, 'color': Colors.purple},
    {'name': 'Electronics', 'icon': Icons.devices, 'color': Colors.orange},
    {'name': 'Investments', 'icon': Icons.home, 'color': Colors.yellow},
    {'name': 'Life', 'icon': Icons.person, 'color': Colors.green},
    {'name': 'Transportation', 'icon': Icons.directions_bus, 'color': Colors.red},
  ];

  final List<String> paymentMethods = ['Physical Cash', 'Credit Card', 'Debit Card', 'UPI'];
  final List<String> currency = ['INR (₹)', 'EUR (€)', 'GBP (£)', 'AZN (₼)'];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Gradient background applied directly to the scaffold
        Positioned.fill(
          child: Container(
            color : const Color.fromRGBO(20, 19, 38, 1),
              child: Container (
                decoration: const BoxDecoration(
                gradient: RadialGradient(
                  radius: 0.7,
                  colors: [
                    Color.fromRGBO(232, 64, 64, 0.4),
                    Color.fromRGBO(20, 19, 38, 0.0),
                  ],
                  stops: [0.0, 1.0],
                  center: Alignment.topLeft,
                ),
              ),
              child: Container (
                decoration: const BoxDecoration(
                gradient: RadialGradient(
                  radius: 1.4,
                  colors: [
                    Color.fromRGBO(232, 64, 64, 0.3),
                    Color.fromRGBO(20, 19, 38, 0.0),
                  ],
                  stops: [0.0, 1.0],
                  center: Alignment.centerRight,
                ),
              ),
            ),
            ),
          ),
        ),
        // Main content
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.close),
              color: Colors.white,
              onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildIncomeExpenseButton('INCOME', Colors.red),
                    buildIncomeExpenseButton('EXPENSE', Colors.orange),
                  ],
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView(
                    children: [
                      buildCard('Transaction', '2:05 p.m | Sep 01, 2022'),
                      buildCustomCategoryDropdown('Category', selectedCategory, categories),
                      buildCard('Amount', '₹235'),
                      buildDropdownCard('Currency', selectedCurrency, currency, (String? newValue) {
                        setState(() {
                          selectedCurrency = newValue!;
                        });
                      }),
                      buildDropdownCard('Payment Method', selectedPaymentMethod, paymentMethods, (String? newValue) {
                        setState(() {
                          selectedPaymentMethod = newValue!;
                        });
                      }),
                      buildCard('Description', 'Weekly groceries'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Build custom category dropdown using a ModalBottomSheet
  Widget buildCustomCategoryDropdown(String title, String selectedValue, List<Map<String, dynamic>> categories) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(
          color: Color.fromRGBO(255, 255, 255, 0.2),
          width: 1,
        ),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      color: const Color.fromRGBO(255, 255, 255, 0.1),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
              
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: const Color.fromRGBO(20, 19, 38, 1),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                  ),
                  builder: (BuildContext context) {
                    return ListView(
                      padding: const EdgeInsets.all(20.0),
                      children: categories.map((category) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: category['color'],
                            child: Icon(
                              category['icon'],
                              color: Colors.black,
                            ),
                          ),
                          title: Text(
                            category['name'],
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            setState(() {
                              selectedCategory = category['name'];
                            });
                            Navigator.pop(context);
                          },
                        );
                      }).toList(),
                    );
                  },
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedValue,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                    size: 30,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 2,
              color: const Color.fromRGBO(227, 181, 60, 1),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIncomeExpenseButton(String text, Color color) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.8), Colors.orange],
          ),
        ),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: text == 'INCOME'
                  ? const BorderRadius.only(topRight: Radius.circular(30))
                  : const BorderRadius.only(topLeft: Radius.circular(30)),
            ),
          ),
          child: Text(text, style: const TextStyle(color: Colors.white)),
        ),
      ),

    );
  }


  Widget buildCard(String title, String content) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(
          color: Color.fromRGBO(255, 255, 255, 0.2),
          width: 1,
        ),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      color: const Color.fromRGBO(255, 255, 255, 0.1),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,

              ),
            ),
            const SizedBox(height: 16),
            Text(
              content,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 2,
              color: const Color.fromRGBO(227, 181, 60, 1),
            ),
          ],
        ),
      ),
    );
  }


Widget buildDropdownCard(String title, String selectedValue, List<String> options, ValueChanged<String?> onChanged) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
      side: const BorderSide(
        color: Color.fromRGBO(255, 255, 255, 0.2),
        width: 1,
      ),
    ),
    margin: const EdgeInsets.symmetric(vertical: 10),
    color: const Color.fromRGBO(255, 255, 255, 0.1),
    child: Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: const Color.fromRGBO(20, 19, 38, 1),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                ),
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0), // Padding for left and right
                    child: ListView(
                      padding: const EdgeInsets.all(16.0),
                      children: options.map((option) {
                        return ListTile(
                          title: Text(
                            option,
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            onChanged(option);
                            Navigator.pop(context);
                          },
                        );
                      }).toList(),
                    ),
                  );
                },
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedValue,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                  size: 30, // Increase the size of the dropdown arrow
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 2,
            color: const Color.fromRGBO(227, 181, 60, 1),
          ),
        ],
      ),
    ),
  );
}
}
