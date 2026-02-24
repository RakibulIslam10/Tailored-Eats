import 'package:get/get.dart';

import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tailored_eats/core/api/end_point/api_end_points.dart';
import 'package:tailored_eats/core/utils/app_storage.dart';

import '../../core/utils/basic_import.dart';

import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class IngredientModel {
  TextEditingController nameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  IngredientModel({String name = '', String quantity = ''}) {
    nameController.text = name;
    quantityController.text = quantity;
  }

  void dispose() {
    nameController.dispose();
    quantityController.dispose();
  }

  Map<String, dynamic> toJson() => {
    'name': nameController.text.trim(),
    'quantity': quantityController.text.trim(),
  };
}

class AddCustomMealController extends GetxController {
  final formKey = GlobalKey<FormState>();

  // Basic fields
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final imageController = TextEditingController();
  final selectedTime = ''.obs;

  // Details
  final priceController = TextEditingController();
  final caloriesController = TextEditingController();
  final prepTimeController = TextEditingController();

  // Macros
  final carbsController = TextEditingController();
  final proteinController = TextEditingController();
  final fatController = TextEditingController();

  // Ingredients
  final ingredients = <IngredientModel>[].obs;

  // Instructions
  final instructionControllers = <TextEditingController>[].obs;

  final isLoading = false.obs;

  final timeOptions = ['Breakfast', 'Lunch', 'Dinner', 'Snack'];

  @override
  void onInit() {
    super.onInit();
    addIngredient();
    addInstruction();
  }

  void addIngredient() {
    ingredients.add(IngredientModel());
  }

  void removeIngredient(int index) {
    if (ingredients.length > 1) {
      ingredients[index].dispose();
      ingredients.removeAt(index);
    }
  }

  void addInstruction() {
    instructionControllers.add(TextEditingController());
  }

  void removeInstruction(int index) {
    if (instructionControllers.length > 1) {
      instructionControllers[index].dispose();
      instructionControllers.removeAt(index);
    }
  }

  Future<void> addCustomMeal() async {
    if (!formKey.currentState!.validate()) return;
    if (selectedTime.value.isEmpty) {
      CustomSnackBar.error('Please select meal time');
      return;
    }

    isLoading.value = true;
    try {
      final body = {
        'name': nameController.text.trim(),
        'description': descriptionController.text.trim(),
        'image': imageController.text.trim(),
        'time': selectedTime.value,
        'details': {
          'price': double.tryParse(priceController.text.trim()) ?? 0,
          'calories': int.tryParse(caloriesController.text.trim()) ?? 0,
          'prepTime': int.tryParse(prepTimeController.text.trim()) ?? 0,
        },
        'macros': {
          'carbs': int.tryParse(carbsController.text.trim()) ?? 0,
          'protein': int.tryParse(proteinController.text.trim()) ?? 0,
          'fat': int.tryParse(fatController.text.trim()) ?? 0,
        },
        'ingredients': ingredients
            .where((e) => e.nameController.text.trim().isNotEmpty)
            .map((e) => e.toJson())
            .toList(),
        'instructions': instructionControllers
            .map((e) => e.text.trim())
            .where((e) => e.isNotEmpty)
            .toList(),
      };

      // ── Console Print ──
      const encoder = JsonEncoder.withIndent('  ');
      final prettyBody = encoder.convert(body);
      debugPrint('┌─────────────────────────────────────────────');
      debugPrint('│ 🚀 ADD CUSTOM MEAL - API REQUEST');
      debugPrint('│ URL   : ${ApiEndPoints.addCustomMeal}');
      debugPrint('│ METHOD: POST');
      debugPrint('├─────────────────────────────────────────────');
      debugPrint('│ BODY:');
      for (final line in prettyBody.split('\n')) {
        debugPrint('│ $line');
      }
      debugPrint('└─────────────────────────────────────────────');

      var token = AppStorage.token;
      final response = await http.post(
        Uri.parse(ApiEndPoints.addCustomMeal),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(body),
      );

      debugPrint('┌─────────────────────────────────────────────');
      debugPrint('│ 📥 ADD CUSTOM MEAL - API RESPONSE');
      debugPrint('│ STATUS CODE: ${response.statusCode}');
      debugPrint('├─────────────────────────────────────────────');
      try {
        final prettyResponse = encoder.convert(jsonDecode(response.body));
        for (final line in prettyResponse.split('\n')) {
          debugPrint('│ $line');
        }
      } catch (_) {
        debugPrint('│ ${response.body}');
      }
      debugPrint('└─────────────────────────────────────────────');

      if (response.statusCode == 201) {
        Get.close(1);
        CustomSnackBar.success(
          title: 'Success',
          message: 'Custom meal added successfully!',
        );
        
      } else {
        final data = jsonDecode(response.body);
        CustomSnackBar.error(data['message'] ?? 'Something went wrong');
      }
    } catch (e) {
      debugPrint('❌ ADD CUSTOM MEAL ERROR: $e');
      CustomSnackBar.error('Failed to add meal. Please try again.');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    descriptionController.dispose();
    imageController.dispose();
    priceController.dispose();
    caloriesController.dispose();
    prepTimeController.dispose();
    carbsController.dispose();
    proteinController.dispose();
    fatController.dispose();
    for (final i in ingredients) {
      i.dispose();
    }
    for (final c in instructionControllers) {
      c.dispose();
    }
    super.onClose();
  }
}
