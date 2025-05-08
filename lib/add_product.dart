import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _price = '';
  String _description = '';
  String _category = 'Hoodies';
  String _size = 'M';

  final List<String> categories = ['Hoodies', 'Shoes', 'Jeans', 'Accessories', 'Tops'];
  final List<String> sizes = ['XS', 'S', 'M', 'L', 'XL', 'XXL'];

  final Color softLavender = Color(0xFFC8B3FF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
        backgroundColor: softLavender,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text(
                'Add New Product',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Product Name',
                  labelStyle: TextStyle(color: softLavender),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
                onSaved: (value) => _name = value ?? '',
                validator: (value) =>
                    (value == null || value.isEmpty) ? 'Please enter a product name' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Price',
                  labelStyle: TextStyle(color: softLavender),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
                keyboardType: TextInputType.number,
                onSaved: (value) => _price = value ?? '',
                validator: (value) =>
                    (value == null || value.isEmpty) ? 'Please enter a price' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Description',
                  labelStyle: TextStyle(color: softLavender),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
                onSaved: (value) => _description = value ?? '',
                validator: (value) =>
                    (value == null || value.isEmpty) ? 'Please enter a description' : null,
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _category,
                decoration: InputDecoration(
                  labelText: 'Category',
                  labelStyle: TextStyle(color: softLavender),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
                items: categories.map((cat) {
                  return DropdownMenuItem<String>(
                    value: cat,
                    child: Text(cat),
                  );
                }).toList(),
                onChanged: (value) => setState(() => _category = value!),
                validator: (value) =>
                    (value == null || value.isEmpty) ? 'Please select a category' : null,
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _size,
                decoration: InputDecoration(
                  labelText: 'Size',
                  labelStyle: TextStyle(color: softLavender),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
                items: sizes.map((sz) {
                  return DropdownMenuItem<String>(
                    value: sz,
                    child: Text(sz),
                  );
                }).toList(),
                onChanged: (value) => setState(() => _size = value!),
                validator: (value) =>
                    (value == null || value.isEmpty) ? 'Please select a size' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Product Added Successfully!')),
                    );
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: softLavender,
                  padding: EdgeInsets.symmetric(vertical: 12),
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
