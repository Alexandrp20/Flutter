import 'package:flutter/material.dart';

class AuthenticationTextFormField extends StatelessWidget {
  const AuthenticationTextFormField({
    Key? key,
    required this.icon,
    required this.label,
    required this.textEditingController,
  }) : super(key: key);

  final IconData icon;
  final String label;

  final TextEditingController textEditingController;

  //--------------------ВАЛИДАЦИЯ--------------------
  String? validate({required String? value}) {
    if (value!.isEmpty) {
      return 'Поле не должно быть пусто';
    }

    if ((key.toString().contains('email')) &&
        RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value) == false) {
      return 'Не правильный адрес почты.';
    }

    if ((key.toString().contains('password')) && value.length < 6) {
      return 'Пароль должен быть длиннее шести символов.';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      obscureText: label.contains('Пароль'),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        errorStyle: const TextStyle(fontSize: 14),
        floatingLabelStyle: const TextStyle(fontSize: 20),
        icon: Icon(
          icon,
          color: Theme.of(context).primaryColor,
        ),
        labelText: label,
      ),
      validator: (value) => validate(value: value),
    );
  }
}
