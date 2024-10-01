import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_with_firebase/UIwith_cred/loginpage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isobsecure = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Register",
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
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    label: Text(
                      "Email",
                      style: theme.textTheme.labelLarge,
                    )),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please enter the email";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      label:
                          Text("Username", style: theme.textTheme.labelLarge)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter the username";
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
                      label:
                          Text("password", style: theme.textTheme.labelLarge)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter the password";
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
                        if (_formKey.currentState!.validate()) {}
                      },
                      child: const Text("Register"))),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account",
                      style: theme.textTheme.labelLarge!
                          .copyWith(color: theme.colorScheme.onSurface)),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Loginpage()));
                      },
                      child: const Text(
                        "Login",
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
