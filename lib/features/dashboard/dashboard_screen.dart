import 'package:flutter/material.dart';
import 'package:travel_erp/features/auth/auth_controller.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TMS Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await logoutUser();
              if (context.mounted) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/Login',
                  (route) => false,
                );
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: [
            _buildModuleCard(context, 'HR', Icons.people, '/hr'),
            _buildModuleCard(
              context,
              'Finance',
              Icons.attach_money,
              '/finance',
            ),
            _buildModuleCard(
              context,
              'Ticketing',
              Icons.flight_takeoff,
              '/ticketing',
            ),
            _buildModuleCard(context, 'Visa', Icons.assignment, '/visa'),
          ],
        ),
      ),
    );
  }

  Widget _buildModuleCard(
    BuildContext context,
    String title,
    IconData icon,
    String route,
  ) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Card(
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
