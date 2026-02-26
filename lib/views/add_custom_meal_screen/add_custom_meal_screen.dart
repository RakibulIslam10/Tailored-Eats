import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tailored_eats/views/add_custom_meal_screen/add_custom_meal_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/utils/basic_import.dart';
import '../../widgets/auth_app_bar.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tailored_eats/views/add_custom_meal_screen/add_custom_meal_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/utils/basic_import.dart';
import '../../widgets/auth_app_bar.dart';

class AddCustomMealScreen extends GetView<AddCustomMealController> {
  const AddCustomMealScreen({super.key});

  static const Color _darkBg = Color(0xFF0F0F0F);
  static const Color _darkCard = Color(0xFF1A1A1A);
  static const Color _darkBorder = Color(0xFF2E2E2E);
  static const Color _textPrimary = Color(0xFFF1F1F1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _darkBg,
      appBar: AppBar(
        backgroundColor: _darkBg,
        scrolledUnderElevation: 0,
        centerTitle: true,
        leading: InkWell(
          borderRadius: BorderRadius.circular(8.r),
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back_ios, color: _textPrimary, size: 20.h),
        ),
        title: TextWidget(
          'Add Custom Meal',
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: _textPrimary,
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.h),
          child: Container(height: 1.h, color: _darkBorder),
        ),
      ),
      body: Form(
        key: controller.formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.horizontalSize,
            vertical: Dimensions.verticalSize * 0.6,
          ),
          child: Column(
            crossAxisAlignment: crossStart,
            children: [
              // ── Basic Info Section ──
              _DarkSectionCard(
                title: 'Basic Information',
                icon: Icons.restaurant_menu,
                child: Column(
                  crossAxisAlignment: crossStart,
                  children: [
                    _DarkLabel('Meal Name'),
                    Space.height.btnInputTitleAndBox,
                    PrimaryInputFieldWidget(
                      hintText: 'e.g. Grilled Chicken with Brown Rice',
                      controller: controller.nameController,
                    ),
                    Space.height.betweenInputBox,
                    _DarkLabel('Description'),
                    Space.height.btnInputTitleAndBox,
                    PrimaryInputFieldWidget(
                      hintText: 'Enter meal description...',
                      controller: controller.descriptionController,
                      maxLines: 3,
                    ),
                    Space.height.betweenInputBox,
                    _DarkLabel('Image URL', optional: true),
                    Space.height.btnInputTitleAndBox,
                    PrimaryInputFieldWidget(
                      hintText: 'https://example.com/image.jpg',
                      controller: controller.imageController,
                      requiredField: false,
                    ),
                    Space.height.betweenInputBox,
                    _DarkLabel('Meal Time'),
                    Space.height.btnInputTitleAndBox,
                    Obx(() => Row(
                      children: controller.timeOptions.map((time) {
                        final isSelected =
                            controller.selectedTime.value == time;
                        return Expanded(
                          child: GestureDetector(
                            onTap: () =>
                            controller.selectedTime.value = time,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              margin: EdgeInsets.only(
                                right:
                                time != controller.timeOptions.last
                                    ? 8.w
                                    : 0,
                              ),
                              padding:
                              EdgeInsets.symmetric(vertical: 11.h),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? CustomColors.primary
                                    : const Color(0xFF222222),
                                borderRadius: BorderRadius.circular(
                                    Dimensions.radius * 0.8),
                                border: Border.all(
                                  color: isSelected
                                      ? CustomColors.primary
                                      : const Color(0xFF2E2E2E),
                                  width: 1.4,
                                ),
                              ),
                              child: TextWidget(
                                time,
                                textAlign: TextAlign.center,
                                fontSize: Dimensions.labelMedium,
                                fontWeight: FontWeight.w600,
                                color: isSelected
                                    ? Colors.white
                                    : const Color(0xFF888888),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    )),
                  ],
                ),
              ),

              Space.height.v20,

              // ── Details Section ──
              _DarkSectionCard(
                title: 'Details',
                icon: Icons.info_outline,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: crossStart,
                        children: [
                          _DarkLabel('Price (\$)'),
                          Space.height.btnInputTitleAndBox,
                          PrimaryInputFieldWidget(
                            hintText: '0.00',
                            controller: controller.priceController,
                            keyBoardType:
                            const TextInputType.numberWithOptions(
                                decimal: true),
                          ),
                        ],
                      ),
                    ),
                    Space.width.v15,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: crossStart,
                        children: [
                          _DarkLabel('Calories'),
                          Space.height.btnInputTitleAndBox,
                          PrimaryInputFieldWidget(
                            hintText: '0',
                            controller: controller.caloriesController,
                            keyBoardType: TextInputType.number,
                          ),
                        ],
                      ),
                    ),
                    Space.width.v15,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: crossStart,
                        children: [
                          _DarkLabel('Prep (min)'),
                          Space.height.btnInputTitleAndBox,
                          PrimaryInputFieldWidget(
                            hintText: '0',
                            controller: controller.prepTimeController,
                            keyBoardType: TextInputType.number,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Space.height.v20,

              // ── Macros Section ──
              _DarkSectionCard(
                title: 'Macros (g)',
                icon: Icons.pie_chart_outline,
                child: Row(
                  children: [
                    Expanded(
                      child: _MacroBox(
                        label: 'Carbs',
                        color: const Color(0xFF4ECDC4),
                        controller: controller.carbsController,
                      ),
                    ),
                    Space.width.v15,
                    Expanded(
                      child: _MacroBox(
                        label: 'Protein',
                        color: const Color(0xFFFF6B6B),
                        controller: controller.proteinController,
                      ),
                    ),
                    Space.width.v15,
                    Expanded(
                      child: _MacroBox(
                        label: 'Fat',
                        color: const Color(0xFFFFD93D),
                        controller: controller.fatController,
                      ),
                    ),
                  ],
                ),
              ),

              Space.height.v20,

              // ── Ingredients Section ──
              _DarkSectionCard(
                title: 'Ingredients',
                icon: Icons.egg_alt_outlined,
                trailing: _AddButton(onTap: controller.addIngredient),
                child: Obx(() => Column(
                  children: List.generate(
                    controller.ingredients.length,
                        (index) => Padding(
                      padding: EdgeInsets.only(
                        bottom: index < controller.ingredients.length - 1
                            ? Dimensions.spaceBetweenInputBox
                            : 0,
                      ),
                      child: Row(
                        crossAxisAlignment: crossStart,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 8.h),
                            width: 26.w,
                            height: 26.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  CustomColors.primary,
                                  CustomColors.primary.withOpacity(0.6),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: TextWidget(
                              '${index + 1}',
                              fontSize: Dimensions.labelSmall,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          Space.width.v10,
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: crossStart,
                              children: [
                                _DarkLabel('Name'),
                                Space.height.btnInputTitleAndBox,
                                PrimaryInputFieldWidget(
                                  hintText: 'Chicken Breast',
                                  controller: controller
                                      .ingredients[index].nameController,
                                ),
                              ],
                            ),
                          ),
                          Space.width.v10,
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: crossStart,
                              children: [
                                _DarkLabel('Qty'),
                                Space.height.btnInputTitleAndBox,
                                PrimaryInputFieldWidget(
                                  hintText: '200g',
                                  controller: controller
                                      .ingredients[index].quantityController,
                                ),
                              ],
                            ),
                          ),
                          Space.width.v10,
                          GestureDetector(
                            onTap: () =>
                                controller.removeIngredient(index),
                            child: Container(
                              margin: EdgeInsets.only(top: 24.h),
                              padding: EdgeInsets.all(7.r),
                              decoration: BoxDecoration(
                                color: CustomColors.rejected
                                    .withOpacity(0.15),
                                borderRadius: BorderRadius.circular(
                                    Dimensions.radius * 0.5),
                                border: Border.all(
                                  color: CustomColors.rejected
                                      .withOpacity(0.3),
                                  width: 1,
                                ),
                              ),
                              child: Icon(
                                Icons.delete_outline,
                                color: CustomColors.rejected,
                                size: 16.h,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
              ),

              Space.height.v20,

              _DarkSectionCard(
                title: 'Instructions',
                icon: Icons.format_list_numbered,
                trailing: _AddButton(onTap: controller.addInstruction),
                child: Obx(() => Column(
                  children: List.generate(
                    controller.instructionControllers.length,
                        (index) => Padding(
                      padding: EdgeInsets.only(
                        bottom: index <
                            controller.instructionControllers.length - 1
                            ? Dimensions.spaceBetweenInputBox
                            : 0,
                      ),
                      child: Row(
                        crossAxisAlignment: crossStart,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 8.h),
                            width: 26.w,
                            height: 26.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color:
                              CustomColors.primary.withOpacity(0.15),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: CustomColors.primary.withOpacity(0.4),
                                width: 1,
                              ),
                            ),
                            child: TextWidget(
                              '${index + 1}',
                              fontSize: Dimensions.labelSmall,
                              fontWeight: FontWeight.w700,
                              color: CustomColors.primary,
                            ),
                          ),
                          Space.width.v10,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: crossStart,
                              children: [
                                _DarkLabel('Step ${index + 1}'),
                                Space.height.btnInputTitleAndBox,
                                PrimaryInputFieldWidget(
                                  hintText: 'Enter instruction step...',
                                  controller: controller
                                      .instructionControllers[index],
                                  maxLines: 2,
                                  requiredField: false,
                                ),
                              ],
                            ),
                          ),
                          Space.width.v10,
                          GestureDetector(
                            onTap: () =>
                                controller.removeInstruction(index),
                            child: Container(
                              margin: EdgeInsets.only(top: 24.h),
                              padding: EdgeInsets.all(7.r),
                              decoration: BoxDecoration(
                                color: CustomColors.rejected
                                    .withOpacity(0.15),
                                borderRadius: BorderRadius.circular(
                                    Dimensions.radius * 0.5),
                                border: Border.all(
                                  color: CustomColors.rejected
                                      .withOpacity(0.3),
                                  width: 1,
                                ),
                              ),
                              child: Icon(
                                Icons.delete_outline,
                                color: CustomColors.rejected,
                                size: 16.h,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
              ),

              Space.height.v30,

              // ── Submit Button ──
              Obx(() => PrimaryButtonWidget(
                title: 'Add Custom Meal',
                isLoading: controller.isLoading.value,
                onPressed: controller.addCustomMeal,
              )),

              Space.height.v30,
            ],
          ),
        ),
      ),
    );
  }
}

class _DarkLabel extends StatelessWidget {
  final String text;
  final bool optional;
  const _DarkLabel(this.text, {this.optional = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextWidget(
          text,
          fontSize: Dimensions.titleSmall * 0.95,
          fontWeight: FontWeight.w500,
          color: const Color(0xFFD0D0D0),
        ),
        if (optional) ...[
          Space.width.v5,
          TextWidget(
            '(optional)',
            fontSize: Dimensions.labelSmall,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF555555),
          ),
        ],
      ],
    );
  }
}

// ── Macro Box ──
class _MacroBox extends StatelessWidget {
  final String label;
  final Color color;
  final TextEditingController controller;
  const _MacroBox({
    required this.label,
    required this.color,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        Row(
          children: [
            Container(
              width: 8.w,
              height: 8.h,
              decoration:
              BoxDecoration(color: color, shape: BoxShape.circle),
            ),
            Space.width.v5,
            TextWidget(
              label,
              fontSize: Dimensions.titleSmall * 0.95,
              fontWeight: FontWeight.w500,
              color: const Color(0xFFD0D0D0),
            ),
          ],
        ),
        Space.height.btnInputTitleAndBox,
        PrimaryInputFieldWidget(
          hintText: '0',
          controller: controller,
          keyBoardType: TextInputType.number,
        ),
      ],
    );
  }
}

// ── Add Button ──
class _AddButton extends StatelessWidget {
  final VoidCallback onTap;
  const _AddButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: CustomColors.primary.withOpacity(0.12),
          borderRadius: BorderRadius.circular(Dimensions.radius * 0.6),
          border: Border.all(
            color: CustomColors.primary.withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: mainMin,
          children: [
            Icon(Icons.add_circle_outline,
                color: CustomColors.primary, size: 15.h),
            Space.width.v5,
            TextWidget(
              'Add',
              fontSize: Dimensions.labelMedium,
              fontWeight: FontWeight.w600,
              color: CustomColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}

// ── Dark Section Card ──
class _DarkSectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget child;
  final Widget? trailing;

  static const Color _darkCard = Color(0xFF1A1A1A);
  static const Color _darkBorder = Color(0xFF2E2E2E);

  const _DarkSectionCard({
    required this.title,
    required this.icon,
    required this.child,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.paddingSize * 0.65),
      decoration: BoxDecoration(
        color: _darkCard,
        borderRadius: BorderRadius.circular(Dimensions.radius * 1.2),
        border: Border.all(color: _darkBorder, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: mainSpaceBet,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(6.r),
                    decoration: BoxDecoration(
                      color: CustomColors.primary.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Icon(
                      icon,
                      color: CustomColors.primary,
                      size: 15.h,
                    ),
                  ),
                  Space.width.v10,
                  TextWidget(
                    title,
                    fontSize: Dimensions.titleSmall * 1.05,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFFF1F1F1),
                  ),
                ],
              ),
              if (trailing != null) trailing!,
            ],
          ),
          Space.height.v10,
          Container(height: 1.h, color: _darkBorder),
          Space.height.v15,
          child,
        ],
      ),
    );
  }
}