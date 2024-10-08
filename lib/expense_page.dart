// ignore_for_file: unused_field, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'template_page.dart';
import 'home_page.dart';

class ExpensePage extends StatefulWidget {
  const ExpensePage({super.key});

  @override
  _ExpensePageState createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> {
  final List<Map<String, dynamic>> _categories = [
    {'name': 'Groceries', 'icon': Icons.shopping_cart, 'color': const Color.fromRGBO(97, 216, 216, 1)},
    {'name': 'Apparels', 'icon': Icons.checkroom, 'color': Colors.purple},
    {'name': 'Electronics', 'icon': Icons.devices, 'color': Colors.orange},
    {'name': 'Investments', 'icon': Icons.home, 'color': Colors.yellow},
    {'name': 'Life', 'icon': Icons.person, 'color': Colors.green},
    {'name': 'Transportation', 'icon': Icons.directions_bus, 'color': Colors.red},
  ];

  String _selectedCategory = 'Category';
  String _paymentMethod = 'Payment Method';
  String _amount = '0';
  String _description = '';

  // Add numbers to the displayed amount
  void _onKeypadPress(String value) {
    setState(() {
      if (_amount == '0' && value != '.') {
        _amount = value;
      } else {
        _amount += value;
      }
    });
  }

  // Handle backspace key
  void _onBackspacePress() {
    setState(() {
      if (_amount.isNotEmpty) {
        _amount = _amount.substring(0, _amount.length - 1);
      }
      if (_amount.isEmpty) {
        _amount = '0';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Gradient background
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
                  center: Alignment.bottomCenter,
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
            actions: [
              DropdownButton<String>(
                value: _paymentMethod,
                dropdownColor: Colors.black,
                icon: const Icon(Icons.keyboard_arrow_down, color: Color.fromRGBO(227, 181, 60, 1)),
                underline: Container(),
                items: <String>['Payment Method', 'Credit Card', 'Cash', 'Bank Transfer']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: const TextStyle(color: Color.fromRGBO(227, 181, 60, 1))),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _paymentMethod = newValue!;
                  });
                },
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              children: [
                // Positioned Dropdown Button
                // Category Button with showModalBottomSheet
                Positioned(
                  bottom: 690, // Adjust as needed
                  left: MediaQuery.of(context).size.width * 0.30, // Centered horizontally
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20), // Adjust border radius for clipping
                    child: Container(
                      width: 160, // Set a specific width
                      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5), // Adjust padding
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(227, 60, 60, 1),
                            Color.fromRGBO(227, 130, 60, 1),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            backgroundColor: const Color.fromRGBO(20, 19, 38, 1),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                            ),
                            builder: (BuildContext context) {
                              return Container(
                                height: MediaQuery.of(context).size.height * 0.7, // Adjust the height as needed
                                padding: const EdgeInsets.all(16.0),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: _categories.map((category) {
                                    return Padding(
                                      padding: const EdgeInsets.only(bottom: 20.0), // Add spacing between ListTiles
                                      child: ListTile(
                                        leading: CircleAvatar(
                                          radius: 25, // Increase the radius for a larger icon
                                          backgroundColor: category['color'],
                                          child: Icon(
                                            category['icon'],
                                            size: 30, // Increase the size of the icon
                                            color: Colors.black,
                                          ),
                                        ),
                                        title: Text(
                                          category['name'],
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18, // Increase the font size for the text
                                          ),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            _selectedCategory = category['name'];
                                          });
                                          Navigator.pop(context);
                                        },
                                      ),
                                    );
                                  }).toList(),
                                ),
                              );
                            },
                          );

                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5), // Adjust padding
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                _selectedCategory,
                                style: const TextStyle(color: Colors.white, fontSize: 14), // Adjust font size
                              ),
                            ),
                            const Icon(Icons.keyboard_arrow_down, color: Colors.white),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                Column(
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
                    const SizedBox(height: 100),
                    // Amount Display
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '-',
                          style: TextStyle(color: Colors.white, fontSize: 40),
                        ),
                        Text(
                          '₹ $_amount',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    // Description TextField
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          _description = value;
                        });
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: 'Add Description',
                        hintStyle: TextStyle(color: Colors.white54),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color.fromRGBO(227, 181, 60, 1)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    // Insert Template Button
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4), // Rectangular shape
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromRGBO(227, 130, 60, 1),
                            Color.fromRGBO(227, 60, 60, 1),
                          ],
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                           Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const TemplatePage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: Colors.transparent, 
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4), 
                          ),
                        ),
                        child: const Text('Insert Template', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    const Spacer(),
                    // Keypad
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: _buildKeypadRow(['1', '2', '3']),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: _buildKeypadRow(['4', '5', '6']),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: _buildKeypadRow(['7', '8', '9']),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildKeypadButton('.', onTap: () => _onKeypadPress('.')),
                            _buildKeypadButton('0', onTap: () => _onKeypadPress('0')),
                            _buildKeypadButton(
                              'assets/icons/logout.png', // Use your custom backspace icon
                              onTap: _onBackspacePress,
                              isIcon: true,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Helper method to create a row of keypad buttons
  List<Widget> _buildKeypadRow(List<String> keys) {
    return keys.map((key) {
      return _buildKeypadButton(key, onTap: () => _onKeypadPress(key));
    }).toList();
  }

  // Helper method to build a keypad button
  Widget _buildKeypadButton(dynamic label, {required VoidCallback onTap, bool isIcon = false}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: isIcon
                  ? Image.asset(label, width: 30, height: 30) // Display custom icon
                  : Text(
                      label,
                      style: const TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold), // Make text bold
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
