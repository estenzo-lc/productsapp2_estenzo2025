import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
    _nameController = TextEditingController(text: widget.product.name);
    _descriptionController = TextEditingController(
      text: widget.product.description,
    );
    _priceController = TextEditingController(
      text: widget.product.price.toString(),
    );
    _currentImagePath = widget.product.imagePath ?? '';
    _loadCategories();
  }

  void _loadCategories() async {
    try {
      _categories = await CategoryService.getCategories();
      _selectedCategoryId = widget.product.categoryId.toString();
    } catch (e) {
      // Handle errors if needed
    } finally {
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
    final url = Uri.parse(
      '${AppConfig.baseUrl}/api/products/${widget.product.id}',
    );
    var request =
        http.MultipartRequest('POST', url)
          ..fields['_method'] =
              'PUT' // Laravel method spoofing
          ..fields['name'] = _nameController.text
          ..fields['description'] = _descriptionController.text
          ..fields['price'] = _priceController.text
          ..fields['category_id'] = _selectedCategoryId!;

    if (_pickedImage != null) {
      request.files.add(
        await http.MultipartFile.fromPath('image', _pickedImage!.path),
      );
    }

    final response = await request.send();

    if (response.statusCode == 200) {
      Navigator.pop(context);
    } else {
      final respStr = await response.stream.bytesToString();
      print('Update failed: $respStr');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to update product')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product'),
        backgroundColor: const Color(0xFFBEC1FF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: _pickImage,
                child:
                    _pickedImage != null
                        ? Image.file(
                          _pickedImage!,
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                        )
                        : (_currentImagePath != null &&
                            _currentImagePath!.isNotEmpty)
                        ? Image.network(
                          '${AppConfig.baseUrl}/storage/$_currentImagePath',
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                        )
                        : Image.asset(
                          'assets/placeholder.png',
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
              ),
              TextButton(
                onPressed: _pickImage,
                child: const Text('Change Image'),
              ),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
              TextField(
                controller: _priceController,
                decoration: const InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              _isLoadingCategories
                  ? const CircularProgressIndicator()
                  : DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Category',
                      border: OutlineInputBorder(),
                    ),
                    value: _selectedCategoryId,
                    items:
                        _categories.map((category) {
                          return DropdownMenuItem<String>(
                            value: category['id'].toString(),
                            child: Text(category['name']),
                          );
                        }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedCategoryId = value;
                      });
                    },
                  ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _updateProduct,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFC0D7FF),
                ),
                child: const Text('Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
