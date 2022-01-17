import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../Service/auth_service.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = '';
  String? password;

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            key: _key,
            children: [
              const SizedBox(
                height: 80,
              ),

              Lottie.asset('assets/lottieJSON/bus.json',
                  width: 600, height: 200, fit: BoxFit.cover),

              // ClipRRect(
              //   borderRadius: BorderRadius.circular(100),
              //   child: Image.network(
              //     'https://cdn.dribbble.com/users/330915/screenshots/5676354/media/e151885ba4d799b4262cb38259d33fbc.gif',
              //     height: 300,
              //   ),
              // ),
              const SizedBox(
                height: 90,
              ),
              const Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Form(
                  child: Column(
                children: [
                  TextField(
                    controller: _userNameController,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0.0),
                      labelText: 'Email',
                      hintText: 'Username or e-mail',
                      labelStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                      prefixIcon: const Icon(
                        Iconsax.user,
                        color: Colors.black,
                        size: 18,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey.shade200, width: 2),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      floatingLabelStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1.5),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _passwordController,
                    onSubmitted: (value) => TextInputAction.next,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0.0),
                      labelText: 'Password',
                      hintText: 'Password',
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                      labelStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                      prefixIcon: const Icon(
                        Iconsax.key,
                        color: Colors.black,
                        size: 18,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey.shade200, width: 2),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      floatingLabelStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1.5),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/SignUp');
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  MaterialButton(
                    onPressed: () async {
                      setState(() {
                        name = _userNameController.value.text;
                        password = _passwordController.value.text;
                      });
                      name = name.trim(); //remove spaces
                      name = name.toLowerCase(); //convert to lowercase
                      await Provider.of<AuthService>(context, listen: false)
                          .registerWithEmailAndPassword(name, password!);
                      Navigator.pop(context); //pop the current screen
                    },
                    height: 45,
                    color: Colors.blue,
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Divider(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/SignUp');
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
