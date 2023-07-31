import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;

  const CustomSearchBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: context.textTheme.titleLarge!
          .copyWith(fontSize: 16, color: Colors.black,),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        hintText: 'search'.tr,
        hintStyle: context.textTheme.titleLarge!
            .copyWith(fontSize: 16, color: const Color(0xFFc5c5c5)),
        suffixIcon: const Icon(Icons.search),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(
            color: Color(0xFFE9E9E9),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(
            color: Color(0xFFE9E9E9),
          ),
        ),
        fillColor: const Color(0xFFF7F7F9),
        filled: true,
        disabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(
            color: Color(0xFFE9E9E9),
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(
            color: Color(0xFFE9E9E9),
          ),
        ),
      ),
    );
  }
}
