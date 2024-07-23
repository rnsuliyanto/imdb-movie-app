import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: RegistrationForm(),
          ),
        ),
      ),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isUsernameValid = true;
  bool _isEmailValid = true;
  bool _isPasswordValid = true;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
      children: [
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "KELOMPOK BELAJAR ANDROID",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 20),
                child: Center(
                  child: Image.asset(
                    "assets/images/himti.png",
                    width: 300,
                    height: 300,
                  ),
                ),
              ),
              Container(
                width: 315,
                padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: TextField(
                  controller: _usernameController,
                  onChanged: (_) => _validateInputs(),
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Username',
                    labelStyle: TextStyle(color: Colors.red),
                    hintText: 'Masukan Username',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.red,
                    ),
                    errorText:
                        _isUsernameValid ? null : 'Username tidak boleh kosong',
                  ),
                ),
              ),
              Container(
                width: 315,
                padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: TextField(
                  controller: _emailController,
                  onChanged: (_) => _validateInputs(),
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.red),
                    hintText: 'Masukan Email',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.red,
                    ),
                    errorText:
                        _isEmailValid ? null : 'Email tidak valid',
                  ),
                ),
              ),

              PasswordTextField(
                controller: _passwordController,
                onChanged: (_) => _validateInputs(),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      _validateInputs();
                      if (_isUsernameValid && _isEmailValid && _isPasswordValid) {
                        String username = _usernameController.text;
                        String email = _emailController.text;

                        // Pindah ke halaman HomeScreen dengan data yang diinputkan
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(
                              username: username,
                              email: email,
                            ),
                          ),
                        );
                      }
                    },
                    child: Container(
                      width: 250,
                      alignment: Alignment.center,
                      child: Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
              ),

              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: GestureDetector(
                    onTap: () {
                      _showComingSoonAlert(context);
                    },
                    child: Text(
                      "Punya akun? Login",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Center(
                  child: Text(
                    "versi 1.0",
                    style: TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _validateInputs() {
    setState(() {
      _isUsernameValid = _usernameController.text.isNotEmpty;
      _isEmailValid = _emailController.text.isNotEmpty &&
          _emailController.text.contains('@');
      _isPasswordValid = _passwordController.text.isNotEmpty;
    });
  }
}

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  const PasswordTextField({
    Key? key,
    required this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 315,
      padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
      child: TextField(
        controller: widget.controller,
        onChanged: widget.onChanged,
        obscureText: !_isPasswordVisible,
        style: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 14,
        ),
        decoration: InputDecoration(
          labelText: 'Password',
          labelStyle: TextStyle(color: Colors.red),
          hintText: 'Masukan Password',
          border: OutlineInputBorder(),
          prefixIcon: Icon(
            Icons.lock,
            color: Colors.red,
          ),
          suffixIcon: IconButton(
            icon: Icon(
                _isPasswordVisible ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
          ),
        ),
      ),
    );
  }
}

void _showComingSoonAlert(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Informasi"),
        content: Text("Coming Soon"),
        actions: [
          TextButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
