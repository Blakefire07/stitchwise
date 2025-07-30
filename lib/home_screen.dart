import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int customerCount = 0;

  @override
  void initState() {
    super.initState();
    _loadCustomerCount();
  }

  Future<void> _loadCustomerCount() async {
    final prefs = await SharedPreferences.getInstance();
    final customers = prefs.getStringList('customers') ?? [];
    setState(() {
      customerCount = customers.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> buttons = [
      {'label': 'Customers', 'icon': Icons.people, 'onTap': () {}},
      {'label': 'Orders', 'icon': Icons.shopping_bag, 'onTap': () {}},
      {'label': 'Inventory', 'icon': Icons.inventory, 'onTap': () {}},
      {'label': 'Reminders', 'icon': Icons.notifications, 'onTap': () {}},
      {'label': 'Payments', 'icon': Icons.payment, 'onTap': () {}},
      {'label': 'Costing', 'icon': Icons.calculate, 'onTap': () {}},
      {'label': 'Settings', 'icon': Icons.settings, 'onTap': () {}},
      {'label': 'Help', 'icon': Icons.help_outline, 'onTap': () {}},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('StitchWise'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Dashboard Stat Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.deepPurple.shade100),
              ),
              child: Row(
                children: [
                  const Icon(Icons.people, color: Colors.deepPurple),
                  const SizedBox(width: 12),
                  Text(
                    'Total Customers: $customerCount',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // 🔹 Dashboard Buttons Grid
            Expanded(
              child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  final button = buttons[index];
                  return Material(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(12),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: button['onTap'],
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(button['icon'], size: 30, color: Colors.white),
                            const SizedBox(height: 8),
                            Text(
                              button['label'],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
