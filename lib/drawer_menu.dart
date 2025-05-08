import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xFFF3E8FF), // light lavender background
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFFA17AFF), // soft purple
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
              onTap: () {}, // Placeholder
            ),
            _buildDrawerItem(
              icon: Icons.person,
              text: 'Profile',
              onTap: () {}, // Placeholder
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem({required IconData icon, required String text, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Color(0xFF6A0DAD)), // darker purple for contrast
      title: Text(
        text,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      onTap: onTap,
    );
  }
}
