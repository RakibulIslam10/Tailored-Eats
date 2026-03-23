import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/basic_import.dart';
import '../../../widgets/auth_app_bar.dart';
import '../my_meal_controller.dart';

class MyMealDetailsScreen extends GetView<MyMealController> {
  const MyMealDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final meal = controller.mealDetails.value;
    if (meal == null) {
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: CommonAppBar(title: 'Meal Details'),
        body: Center(child: TextWidget('No meal selected', color: Colors.white)),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: _buildBottomButton(),
      body: CustomScrollView(
        slivers: [
          _buildAppBar(meal),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.defaultHorizontalSize,
                vertical: Dimensions.heightSize,
              ),
              child: Column(
                crossAxisAlignment: crossStart,
                children: [
                  _buildTitleSection(meal),
                  Space.height.v20,
                  _buildMacrosSection(meal),
                  Space.height.v25,
                  _buildDescriptionSection(meal),
                  Space.height.v25,
                  _buildIngredientsSection(meal),
                  Space.height.v25,
                  _buildInstructionsSection(meal),
                  Space.height.v100,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(meal) {
    return SliverAppBar(
      expandedHeight: 300.h,
      pinned: true,
      backgroundColor: Colors.black,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        onPressed: () => Get.back(),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImage(
              imageUrl: Uri.tryParse(meal.image)?.hasAbsolutePath == true &&
                      meal.image.startsWith('http')
                  ? meal.image
                  : controller.getRandomImage(),
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.transparent,
                    Colors.black.withOpacity(0.8),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleSection(meal) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        Row(
          mainAxisAlignment: mainSpaceBet,
          children: [
            Expanded(
              child: TextWidget(
                meal.name,
                fontSize: Dimensions.titleLarge,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              decoration: BoxDecoration(
                color: CustomColors.primary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(Dimensions.radius),
              ),
              child: TextWidget(
                "${meal.details.calories} kcal",
                color: CustomColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        Space.height.v10,
        Row(
          children: [
            Icon(Icons.access_time, size: 18, color: CustomColors.grey600),
            Space.width.v5,
            TextWidget(
              "${meal.details.prepTime} mins",
              color: CustomColors.grey600,
              fontSize: Dimensions.bodySmall,
            ),
            Space.width.v15,
            Icon(Icons.monetization_on_outlined,
                size: 18, color: CustomColors.success),
            Space.width.v5,
            TextWidget(
              "\$${meal.details.price}",
              color: CustomColors.success,
              fontSize: Dimensions.bodySmall,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMacrosSection(meal) {
    return Container(
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        color: CustomColors.grey850.withOpacity(0.5),
        borderRadius: BorderRadius.circular(Dimensions.radius),
        border: Border.all(color: CustomColors.grey800, width: 0.5),
      ),
      child: Row(
        mainAxisAlignment: mainCenter,
        children: [
          _buildMacroItem("Carbs", "${meal.macros.carbs}g", Colors.blue),
          _buildMacroItem("Protein", "${meal.macros.protein}g", Colors.red),
          _buildMacroItem("Fat", "${meal.macros.fat}g", Colors.amber),
        ],
      ),
    );
  }

  Widget _buildMacroItem(String label, String value, Color color) {
    return Expanded(
      child: Column(
        children: [
          TextWidget(
            value,
            fontSize: Dimensions.titleSmall,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          TextWidget(
            label,
            fontSize: Dimensions.labelSmall,
            color: color,
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionSection(meal) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        TextWidget(
          "Description",
          fontSize: Dimensions.titleMedium,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        Space.height.v10,
        TextWidget(
          meal.description,
          fontSize: Dimensions.bodyMedium,
          color: CustomColors.grey400,
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }

  Widget _buildIngredientsSection(meal) {
    if (meal.ingredients.isEmpty) return SizedBox.shrink();
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        TextWidget(
          "Ingredients",
          fontSize: Dimensions.titleMedium,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        Space.height.v10,
        ...meal.ingredients.map((ingredient) => Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: Row(
                children: [
                  Icon(Icons.circle, size: 8, color: CustomColors.primary),
                  Space.width.v10,
                  Expanded(
                    child: TextWidget(
                      "${ingredient.name} (${ingredient.quantity})",
                      color: CustomColors.grey400,
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }

  Widget _buildInstructionsSection(meal) {
    if (meal.instructions.isEmpty) return SizedBox.shrink();
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        TextWidget(
          "Instructions",
          fontSize: Dimensions.titleMedium,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        Space.height.v10,
        ...meal.instructions.asMap().entries.map((entry) => Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: Row(
                crossAxisAlignment: crossStart,
                children: [
                  Container(
                    width: 24.w,
                    height: 24.h,
                    decoration: BoxDecoration(
                      color: CustomColors.primary,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: TextWidget(
                      "${entry.key + 1}",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Space.width.v10,
                  Expanded(
                    child: TextWidget(
                      entry.value,
                      color: CustomColors.grey400,
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }

  Widget _buildBottomButton() {
    return Obx(
      () => Padding(
        padding: EdgeInsets.all(Dimensions.defaultHorizontalSize),
        child: PrimaryButtonWidget(
          title: "Ate This",
          onPressed: () => controller.ateMeal(),
          isLoading: controller.isAteLoading.value,
        ),
      ),
    );
  }
}
