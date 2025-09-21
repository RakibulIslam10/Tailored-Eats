part of 'update_profile_screen.dart';

class UpdateProfileScreenMobile extends GetView<UpdateProfileController> {
  const UpdateProfileScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundDark,
      appBar: CommonAppBar(title: "Update Profile"),
      body: SafeArea(
        child: Form(
          key: controller.formKey,
          child: ListView(
            padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
            children: [
              Space.height.v30,
              _buildNameFields(),
              Space.height.v20,

              PrimaryInputFieldWidget(
                label: "Email address",
                hintText: "Enter your email",
                controller: controller.emailController,
                focusNode: controller.emailFocusNode,
                nextFocusNode: controller.ageFocusNode,
                isEmail: true,
                keyBoardType: TextInputType.emailAddress,
                fillColor: Colors.white10,
              ),

              Space.height.v20,

              _buildGenderField(),

              Space.height.v20,

              PrimaryInputFieldWidget(
                label: "How old are you ?",
                hintText: "Age",
                controller: controller.ageController,
                focusNode: controller.ageFocusNode,
                nextFocusNode: controller.passwordFocusNode,
                keyBoardType: TextInputType.number,
                fillColor: Colors.white10,
              ),

              Space.height.v20,

              // Password Field
              PrimaryInputFieldWidget(
                fillColor: Colors.white10,
                label: "Create Password",
                hintText: "Enter your password",
                controller: controller.passwordController,
                focusNode: controller.passwordFocusNode,
                isPassword: true,
              ),

              Space.height.v40,

              // Save Changes Button
              PrimaryButtonWidget(
                title: 'Save Change',
                onPressed: () {},
                buttonTextColor: Colors.black,
              ),

              Space.height.v30,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNameFields() {
    return Row(
      children: [
        // First Name
        Expanded(
          child: PrimaryInputFieldWidget(
            fillColor: Colors.white10,

            label: "First Name",
            hintText: "First name",
            controller: controller.firstNameController,
            focusNode: controller.firstNameFocusNode,
            nextFocusNode: controller.lastNameFocusNode,
          ),
        ),
        Space.width.v15,
        // Last Name
        Expanded(
          child: PrimaryInputFieldWidget(
            fillColor: Colors.white10,

            label: "Last Name",
            hintText: "Last name",
            controller: controller.lastNameController,
            focusNode: controller.lastNameFocusNode,
            nextFocusNode: controller.emailFocusNode,
          ),
        ),
      ],
    );
  }

  Widget _buildGenderField() {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        TextWidget(
          "Gender",
          fontSize: Dimensions.titleMedium * 0.9,
          fontWeight: FontWeight.w500,
          color: CustomColors.whiteColor,
        ),
        Space.height.btnInputTitleAndBox,
        Obx(
          () => Container(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSize * 0.7,
              vertical: Dimensions.heightSize * 0.3,
            ),
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
              border: Border.all(
                color: CustomColors.whiteColor.withAlpha(45),
                width: 1.4,
              ),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: controller.selectedGender.value.isEmpty
                    ? null
                    : controller.selectedGender.value,
                hint: TextWidget(
                  "Male",
                  color: Colors.grey.shade400,
                  fontSize: Dimensions.titleMedium * 0.95,
                ),
                isExpanded: true,
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: CustomColors.whiteColor,
                  size: Dimensions.iconSizeLarge,
                ),
                dropdownColor: CustomColors.blackColor,
                items: controller.genderOptions.map((String gender) {
                  return DropdownMenuItem<String>(
                    value: gender,
                    child: TextWidget(
                      gender,
                      color: CustomColors.whiteColor,
                      fontSize: Dimensions.titleMedium * 0.95,
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    controller.selectedGender.value = newValue;
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
