import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/map_view.dart';
import '../widgets/authentication_text_form_field.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  AuthenticationScreenState createState() => AuthenticationScreenState();
}

class AuthenticationScreenState extends State<AuthenticationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  //Контролерры
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // bool register = true;

  authenticate() {
    if (_formKey.currentState!.validate() == false) {
      return ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Error',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
          backgroundColor: Color.fromARGB(255, 249, 0, 0),
        ),
      );
    }
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MapView(),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Success',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: Colors.greenAccent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Hello =^.^=",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
            fontFamily: 'Verdana',
            fontStyle: FontStyle.italic,
          ),
        ),
        backgroundColor: Colors.lightGreenAccent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
                child: Column(
                  children: [
                    AuthenticationTextFormField(
                      key: const Key('email'),
                      icon: Icons.email,
                      label: 'Электронная почта',
                      textEditingController: emailController,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25, bottom: 25),
                      child: AuthenticationTextFormField(
                        key: const Key('password'),
                        icon: Icons.lock,
                        label: 'Пароль',
                        textEditingController: passwordController,
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(300, 50),
                          shape: const StadiumBorder(),
                          backgroundColor: Colors.amber,
                        ),
                        onPressed: authenticate,
                        child: const Text(
                          "Войти",
                          style: TextStyle(fontSize: 20),
                        )),
                    const SizedBox(height: 25.00),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
