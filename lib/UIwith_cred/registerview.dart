import 'dart:io';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:todo_with_firebase/UIwith_cred/loginpage.dart';
import 'package:todo_with_firebase/UIwith_cred/viewmodel/registermodel.dart';
import 'package:todo_with_firebase/UIwith_cred/viewmodel/signinwithgoogle.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isobsecure = true;
  File? image;

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
              InkWell(
                onTap: () async {
                  final pickedimage = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  if (image == null) return;
                  final imageTemp = File(pickedimage!.path);
                  setState(() => image = imageTemp);
                },
                child: AvatarGlow(
                  child: Material(
                    // Replace this child with your own
                    elevation: 8.0,
                    shape: CircleBorder(),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[100],
                      radius: 30.0,
                      backgroundImage: image != null
                          ? FileImage(image!)
                          : NetworkImage(
                              "https://static.vecteezy.com/system/resources/previews/042/332/098/non_2x/default-avatar-profile-icon-grey-photo-placeholder-female-no-photo-images-for-unfilled-user-profile-greyscale-illustration-for-socail-media-web-vector.jpg"),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
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
                        if (_formKey.currentState!.validate()) {
                          // Registermodel().addReg(
                          //     _emailController.text,
                          //     _usernameController.text,
                          //     _passwordController.text);
                          Registermodel().register(_emailController.text,
                              _passwordController.text, context);
                        }
                      },
                      child: const Text("Register"))),
              SizedBox(
                height: 20,
              ),
              SignInButton(
                Buttons.google,
                onPressed: () {
                  Signinwithgoogle().googlesignin();
                },
              ),
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
