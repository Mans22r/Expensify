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

  final List<String> categories = ['Groceries', 'Rent', 'Utilities', 'Transport'];
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
                  radius: 1.6,
                  colors: [
                    Color.fromRGBO(232, 64, 64, 0.4),
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
          backgroundColor: Colors.transparent, // Set to transparent to see the gradient
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.close),
              color: Colors.white,
              onPressed: () {
                // Navigate back to home page when the close icon is pressed
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
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(227, 60, 60, 1),
                              Color.fromRGBO(227, 130, 60, 1),
                            ],
                          ),
                        ),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            backgroundColor: Colors.transparent,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                              ),
                            ),
                          ),
                          child: const Text('INCOME', style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(227, 160, 60, 1),
                              Color.fromRGBO(227, 130, 60, 1),
                            ],
                          ),
                        ),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            backgroundColor: Colors.transparent,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                              ),
                            ),
                          ),
                          child: const Text('EXPENSE', style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView(
                    children: [
                      buildCard('Transaction', '2:05 p.m | Sep 01, 2022'),
                      buildDropdownCard('Category', selectedCategory, categories, (String? newValue) {
                        setState(() {
                          selectedCategory = newValue!;
                        });
                      }),
                      buildCard('Amount', '₹235'),
                      buildDropdownCard('Currency', selectedCurrency, currency, (String? newValue) {
                        setState(() {
                          selectedPaymentMethod = newValue!;
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

  // Widget to build card with title and text
  Widget buildCard(String title, String content) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(
          color: Color.fromRGBO(255, 255, 255, 0.2),
          width: 1, // 1px border
        ),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      color: const Color.fromRGBO(255, 255, 255, 0.1), // rgba(255, 255, 255, 0.3)
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
                // fontWeight: FontWeight.bold,
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
              color: const Color.fromRGBO(227, 181, 60, 1), // Underline color
            ),
          ],
        ),
      ),
    );
  }

  // Widget to build card with dropdown
  Widget buildDropdownCard(String title, String selectedValue, List<String> options, ValueChanged<String?> onChanged) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(
          color: Color.fromRGBO(255, 255, 255, 0.2), // Border rgba(255, 255, 255, 0.5)
          width: 1, // 1px border
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
                // fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            DropdownButton<String>(
              value: selectedValue,
              dropdownColor: const Color.fromRGBO(30, 30, 50, 1),
              iconEnabledColor: Colors.white,
              isExpanded: true, // Make dropdown expand to card width
              alignment: Alignment.centerRight, // Move icon to the right
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              underline: Container(
                height: 2,
                color: const Color.fromRGBO(227, 181, 60, 1),
              ),
              onChanged: onChanged,
              items: options.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
