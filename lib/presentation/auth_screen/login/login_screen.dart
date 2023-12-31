// ignore_for_file: use_build_context_synchronously

import 'package:dicoding_project/gen/assets.gen.dart';
import 'package:dicoding_project/gen/colors.gen.dart';
import 'package:dicoding_project/presentation/bloc/Authentication/authentacion_bloc.dart';
import 'package:dicoding_project/presentation/res/styles.dart';
import 'package:dicoding_project/services/auth/login_services/login_services.dart';
// import 'package:dicoding_project/services/send_message/send_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const name = "/login";

  @override
  State<LoginScreen> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // final MessageEvent _event = MessageEvent();
  final _formKey = GlobalKey<FormState>();
  final LoginServices _loginServices = LoginServices();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              return _buildLargeScreen(size);
            } else {
              return _buildSmallScreen(size);
            }
          },
        ),
      ),
    );
  }

  /// For large screens
  Widget _buildLargeScreen(
    Size size,
    // SimpleUIController simpleUIController,
  ) {
    return Row(
      children: [
        const Expanded(
          flex: 4,
          child: RotatedBox(
            quarterTurns: 3,
            // child: Lottie.asset(
            //   'assets/coin.json',
            //   height: size.height * 0.3,
            //   width: double.infinity,
            //   fit: BoxFit.fill,
            // ),
          ),
        ),
        SizedBox(width: size.width * 0.06),
        Expanded(
          flex: 5,
          child: _buildMainBody(
            size,
            // simpleUIController,
          ),
        ),
      ],
    );
  }

  /// For Small screens
  Widget _buildSmallScreen(
    Size size,
    // SimpleUIController simpleUIController,
  ) {
    return Center(
      child: _buildMainBody(
        size,
        // simpleUIController,
      ),
    );
  }

  /// Main Body
  Widget _buildMainBody(
    Size size,
    // SimpleUIController simpleUIController,
  ) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: size.width > 600
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            size.width > 600
                ? Container()
                : Center(
                    child: SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: Image.asset(
                          Assets.image.buyOnline.keyName,
                          fit: BoxFit.contain,
                        )),
                  ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Gmail

                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email_rounded),
                        hintText: 'Gmail',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter gmail';
                        } else if (!value.endsWith('@gmail.com')) {
                          return 'please enter valid gmail';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),

                    // / password
                    TextFormField(
                      // style: kTextFormFieldStyle(),
                      controller: passwordController,
                      // obscureText: simpleUIController.isObscure.value,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock_open),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.visibility
                              // : Icons.visibility_off,
                              ),
                          onPressed: () {},
                        ),
                        hintText: 'Password',
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        } else if (value.length < 7) {
                          return 'at least enter 6 characters';
                        } else if (value.length > 13) {
                          return 'maximum character is 13';
                        }
                        return null;
                      },
                    ),

                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    const Text(
                      'Creating an account means you\'re okay with our Terms of Services and our Privacy Policy',
                      // style: kLoginTermsAndPrivacyStyle(size),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),

                    /// Login Button
                    loginButton(),
                    SizedBox(
                      height: size.height * 0.03,
                    ),

                    /// Navigate To Login Screen
                    GestureDetector(
                      onTap: () async {
                        // final token = await _loginServices.loginWithAnonymous();
                        // _loginServices.getStatusAuthenticated.first;
                        emailController.clear();
                        passwordController.clear();
                        _formKey.currentState?.reset();
                        // simpleUIController.isObscure.value = true;
                      },
                      child: RichText(
                        text: const TextSpan(
                          text: 'Don\'t have an account?',
                          // style: kHaveAnAccountStyle(size),
                          children: [
                            TextSpan(
                              text: " Sign up",
                              // style: kLoginOrSignUpTextStyle(
                              //   size,
                              // ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Login Button
  Widget loginButton() {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        onPressed: () async {
          // Validate returns true if the form is valid, or false otherwise.
          // _event.sendMessage("Hello Testing \n Ini Adalah Ilham Suherman");
          if (_formKey.currentState!.validate()) {
            showDialog(
                context: context,
                builder: (context) => const CircularProgressIndicator());
            await Future.delayed(const Duration(milliseconds: 500), () {
              Navigator.of(context).pop();
            });

            await _loginServices.loginWithEmail(
                emailController.value.text, passwordController.value.text);
            context.read<AuthentacionBloc>().add(AuthenticationEventLogIn(
                email: emailController.value.text,
                password: passwordController.value.text));
            // token
            //     ? Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => const MainPage()))
            //     : showDialog(
            //         context: context,
            //         builder: (BuildContext context) {
            //           return AlertDialog(
            //             title: Text('Popup Title'),
            //             content: Text('Ini adalah isi dari popup.'),
            //             actions: <Widget>[
            //               TextButton(
            //                 onPressed: () {
            //                   // Tutup dialog saat tombol ditekan
            //                   Navigator.of(context).pop();
            //                 },
            //                 child: Text('Tutup'),
            //               ),
            //             ],
            //           );
            //         });
            // return;
          }
        },
        child: const Text(
          'Login',
          style: TextStyle(color: ColorName.bg100),
        ),
      ),
    );
  }
}
