import 'package:flutter/material.dart';
import 'package:todo_with_firebase/UIwith_cred/loginmodel.dart';
import 'package:todo_with_firebase/UIwith_cred/otp_verification.dart';
import 'package:todo_with_firebase/UIwith_cred/registerview.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isobsecure = true;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Login",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        label:
                            Text("Email", style: theme.textTheme.labelLarge)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter the email";
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                    obscureText: isobsecure,
                    controller: _passwordController,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isobsecure = !isobsecure;
                              });
                            },
                            icon: Icon(isobsecure
                                ? Icons.visibility_off
                                : Icons.visibility_outlined)),
                        border: const OutlineInputBorder(),
                        label: Text("Password",
                            style: theme.textTheme.labelLarge)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter the password";
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                    controller: _phoneController,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        label: Text("Phone number",
                            style: theme.textTheme.labelLarge)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter the number";
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Loginmodel().login(
                                _emailController.text,
                                _passwordController.text,
                                _phoneController.text,
                                context);
                          }
                        },
                        child: const Text("Login"))),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OtpVerification()));
                      },
                      child: Text("Log in with Mobile Number")),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account",
                        style: theme.textTheme.labelLarge!
                            .copyWith(color: theme.colorScheme.onSurface)),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegisterView()));
                        },
                        child: const Text(
                          "Register",
                        ))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
