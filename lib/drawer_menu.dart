import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFFF3E8FF), // Light lavender background
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFFA17AFF), // Soft purple
              ),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            _buildDrawerItem(
              icon: Icons.home,
              text: 'Home',
              onTap: () => Navigator.pushNamed(context, '/home'),
            ),
            _buildDrawerItem(
              icon: Icons.add_box,
              text: 'Add Product',
              onTap: () => Navigator.pushNamed(context, '/add'),
            ),
            _buildDrawerItem(
              icon: Icons.shopping_cart,
              text: 'Cart',
              onTap: () => Navigator.pushNamed(context, '/cart'),
            ),
            _buildDrawerItem(
              icon: Icons.person,
              text: 'Profile',
              onTap: () => Navigator.pushNamed(context, '/profile'), // ✅ Updated
            ),
            const Divider(),
            _buildDrawerItem(
              icon: Icons.logout,
              text: 'Logout',
              onTap: () => _logout(context),
            ),
          ],
        ),
      ),
    );
  }

  void _logout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF6A0DAD)), // Darker purple
      title: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      onTap: onTap,
    );
  }
}
