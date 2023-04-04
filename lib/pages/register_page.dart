import 'dart:io';

import 'package:article_pilar_teknologi/app.dart';
import 'package:article_pilar_teknologi/helper/constant_url_helper.dart';
import 'package:article_pilar_teknologi/helper/global_method_helper.dart';
import 'package:article_pilar_teknologi/helper/setting_toast_helper.dart';
import 'package:article_pilar_teknologi/models/register_model.dart';
import 'package:article_pilar_teknologi/pages/home_page.dart';
import 'package:article_pilar_teknologi/widgets/button.dart';
import 'package:article_pilar_teknologi/widgets/custom_textformfield.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _firstFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _secondFormKey = GlobalKey<FormState>();
  RegisterModel registerModel = RegisterModel();

  bool obscureTextPassword = true;
  bool isSecondForm = false;

  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _telephone = TextEditingController();
  final TextEditingController _profileImage = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _province = TextEditingController();
  final TextEditingController _country = TextEditingController();

  @override
  void dispose() {
    _firstName.dispose();
    _lastName.dispose();
    _username.dispose();
    _password.dispose();
    _telephone.dispose();
    _profileImage.dispose();
    _address.dispose();
    _city.dispose();
    _province.dispose();
    _country.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            vertical: 24.0,
            horizontal: 16.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hello,',
                style: TextStyle(
                  fontSize: 56.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Register to continue!',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32.0),
              if (!isSecondForm) _firstForm(),
              if (isSecondForm) _secondForm(),
              Button(
                onPressed: () {
                  if (!isSecondForm) {
                    if (_firstFormKey.currentState!.validate()) {
                      isSecondForm = true;
                      setState(() {});
                    }
                  } else {
                    if (_secondFormKey.currentState!.validate()) {
                      _onSubmitForm();
                    }
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(isSecondForm ? 'Submit' : 'Next'),
                    if (!isSecondForm) const Icon(Icons.chevron_right_outlined),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _firstForm() {
    return Form(
      key: _firstFormKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextFormField(
            controller: _firstName,
            label: 'First Name',
            isMandatory: true,
            onChanged: (value) {
              registerModel.firstName = value;
            },
          ),
          CustomTextFormField(
            controller: _lastName,
            label: 'Last Name',
            isMandatory: true,
            onChanged: (value) {
              registerModel.lastName = value;
            },
          ),
          CustomTextFormField(
            controller: _username,
            label: 'Email',
            isMandatory: true,
            validator: (value) {
              return GlobalMethodHelper.validateEmail(value);
            },
            onChanged: (value) {
              registerModel.username = value;
            },
          ),
          CustomTextFormField(
            controller: _password,
            label: 'Password',
            isMandatory: true,
            onChanged: (value) {
              registerModel.password = value;
            },
            obscureText: obscureTextPassword,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  obscureTextPassword = !obscureTextPassword;
                });
              },
              icon: Icon(
                  obscureTextPassword
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: const Color(0xFF94A1AE),
                  size: 24.0),
            ),
          ),
        ],
      ),
    );
  }

  _secondForm() {
    return Form(
      key: _secondFormKey,
      child: ListView(
        shrinkWrap: true,
        primary: false,
        children: [
          GestureDetector(
            onTap: _pickImage,
            child: Row(
              children: [
                SizedBox(
                  height: 70.0,
                  width: 70.0,
                  child: CircleAvatar(
                    backgroundImage: !GlobalMethodHelper.isEmpty(_imageFile)
                        ? Image.file(File(_imageFile!.path)).image
                        : null,
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Profile Image',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      if (!GlobalMethodHelper.isEmpty(_imageFile))
                        const SizedBox(height: 8.0),
                      if (!GlobalMethodHelper.isEmpty(_imageFile))
                        Text(_imageFile!.name),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 24.0),
          CustomTextFormField(
            controller: _telephone,
            label: 'Telephone',
            isMandatory: true,
            prefix: const Text(
              '+62',
              style: TextStyle(color: Colors.black54),
            ),
            keyboardType: TextInputType.phone,
            onChanged: (value) {
              registerModel.telephone = value;
            },
          ),
          CustomTextFormField(
            controller: _address,
            label: 'Address',
            isMandatory: true,
            onChanged: (value) {
              registerModel.address = value;
            },
          ),
          CustomTextFormField(
            controller: _city,
            label: 'City',
            isMandatory: true,
            onChanged: (value) {
              registerModel.city = value;
            },
          ),
          CustomTextFormField(
            controller: _province,
            label: 'Province',
            isMandatory: true,
            onChanged: (value) {
              registerModel.province = value;
            },
          ),
          CustomTextFormField(
            controller: _country,
            label: 'Country',
            isMandatory: true,
            onChanged: (value) {
              registerModel.country = value;
            },
          ),
          GestureDetector(
            onTap: () {
              isSecondForm = false;
              setState(() {});
            },
            child: Row(
              children: const [
                Icon(Icons.chevron_left_outlined),
                Text('Back'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onSubmitForm() async {
    try {
      FormData data = FormData.fromMap({
        'first_name': _firstName.text,
        'last_name': _lastName.text,
        'username': _username.text,
        'password': _password.text,
        'telephone': '+62' + _telephone.text,
        'profile_image': await MultipartFile.fromFile(
          _imageFile!.path,
          // filename: _imageFile!.name,
        ),
        'address': _address.text,
        'city': _city.text,
        'province': _province.text,
        'country': _country.text,
      });

      var result = await App().dio.post(
            ConstantUrlHelper.register,
            data: data,
          );

      print(result);
    } catch (err) {
      showFlutterToast(err.toString());
    }
  }

  Future<void> _pickImage() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 300,
        maxHeight: 300,
      );
      setState(() {
        _imageFile = pickedFile;
      });
    } catch (e) {
      showFlutterToast(e.toString());
    }
  }
}
