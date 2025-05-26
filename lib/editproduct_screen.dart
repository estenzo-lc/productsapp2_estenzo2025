import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'product.dart';
import 'category_service.dart';
import 'config.dart';

class EditProductScreen extends StatefulWidget {
  final Product product;

  const EditProductScreen({super.key, required this.product});

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _priceController;
  String? _selectedCategoryId;
  List<Map<String, dynamic>> _categories = [];
  bool _isLoadingCategories = true;
  File? _pickedImage;
  String? _currentImagePath;
  bool _isPickingImage = false;

  @override
  void initState() {
    super.initState();

    // Initialize text controllers with existing product data
    _nameController = TextEditingController(text: widget.product.name);
    _descriptionController = TextEditingController(text: widget.product.description);
    _priceController = TextEditingController(text: widget.product.price.toString());

    // Save current image path for preview
    _currentImagePath = widget.product.imagePath ?? '';

    // Load categories from API
    _loadCategories();
  }

  void _loadCategories() async {
    try {
      // Fetch category list from CategoryService
      _categories = await CategoryService.getCategories();
      // Set current product category as the selected one
      _selectedCategoryId = widget.product.categoryId.toString();
    } catch (e) {
      // Handle errors
    } finally {
      // Stop showing loading indicator
      setState(() {
        _isLoadingCategories = false;
      });
    }
  }

  Future<void> _pickImage() async {
    if (_isPickingImage) return;

    setState(() {
      _isPickingImage = true;
    });

    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _pickedImage = File(pickedFile.path);
        });
      }
    } finally {
      setState(() {
        _isPickingImage = false;
      });
    }
  }

  Future<void> _updateProduct() async {
    final url = Uri.parse('${AppConfig.baseUrl}/api/products/${widget.product.id}');
    var request = http.MultipartRequest('POST', url);

    // Add form fields
    request.fields['name'] = _nameController.text;
    request.fields['description'] = _descriptionController.text;
    request.fields['price'] = _priceController.text;
    request.fields['category_id'] = _selectedCategoryId!;

    // Attach the picked image file if available
    if (_pickedImage != null) {
      request.files.add(await http.MultipartFile.fromPath('image', _pickedImage!.path));
    }

    final response = await request.send();
    if (response.statusCode == 200) {
      Navigator.pop(context);
    } else {
      // Handle error message here if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product'),
        backgroundColor: const Color(0xFFBEC1FF), // Updated color
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Show the picked image if available or an existing product image
            GestureDetector(
              onTap: _pickImage,
              child: _pickedImage != null
                  ? Image.file(_pickedImage!, height: 120, width: 120, fit: BoxFit.cover)
                  : (_currentImagePath != null && _currentImagePath!.isNotEmpty)
                      ? Image.network('${AppConfig.baseUrl}/storage/$_currentImagePath', height: 120, width: 120, fit: BoxFit.cover)
                      : Image.asset('assets/placeholder.png', height: 120, width: 120, fit: BoxFit.cover),
            ),
            TextButton(
              onPressed: _pickImage,
              child: const Text('Change Image'),
            ),

            // Product name input field
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),

            // Product description input field
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),

            // Product price input field
            TextField(
              controller: _priceController,
              decoration: InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),

            SizedBox(height: 10),

            // Show loading while fetching categories; otherwise show dropdown
            _isLoadingCategories
                ? CircularProgressIndicator()
                : DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Category',
                      border: OutlineInputBorder(),
                    ),
                    value: _selectedCategoryId,
                    items: _categories.map((category) {
                      return DropdownMenuItem<String>(
                        value: category['id'].toString(),
                        child: Text(category['name']),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedCategoryId = value; // Update selected category
                      });
                    },
                  ),

            SizedBox(height: 20),

            // Button to trigger product update
            ElevatedButton(
              onPressed: _updateProduct,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFC0D7FF), // Updated color
              ),
              child: const Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}