import 'package:dicoding_project/services/auth/register_service/register_services.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static const name = "/register";

  @override
  State<RegisterScreen> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final RegisterServices _registerServices = RegisterServices();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // SimpleUIController simpleUIController = Get.put(SimpleUIController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          body: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 600) {
                return _buildLargeScreen(size, theme);
              } else {
                return _buildSmallScreen(size, theme);
              }
            },
          )),
    );
  }

  /// For large screens
  Widget _buildLargeScreen(Size size, ThemeData theme) {
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
          child: _buildMainBody(size, theme),
        ),
      ],
    );
  }

  /// For Small screens
  Widget _buildSmallScreen(Size size, ThemeData theme) {
    return Center(
      child: _buildMainBody(size, theme),
    );
  }

  /// Main Body
  Widget _buildMainBody(Size size, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment:
          size.width > 600 ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        size.width > 600
            ? Container()
            : Container(
                height: 100,
                width: 100,
                color: Colors.grey,
              ),
        SizedBox(
          height: size.height * 0.03,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text(
            'Sign Up',
            // style: kLoginTitleStyle(size),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text(
            'Create Account',
            // style: kLoginSubtitleStyle(size),
          ),
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                /// username
                TextFormField(
                  // style: kTextFormFieldStyle(),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: 'Username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),

                  controller: nameController,
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter username';
                    } else if (value.length < 4) {
                      return 'at least enter 4 characters';
                    } else if (value.length > 13) {
                      return 'maximum character is 13';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),

                /// Gmail
                TextFormField(
                  // style: kTextFormFieldStyle(),
                  controller: emailController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email_rounded),
                    hintText: 'gmail',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
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

                /// password

                TextFormField(
                  // style: kTextFormFieldStyle(),
                  controller: passwordController,
                  // obscureText: simpleUIController.isObscure.value,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_open),
                    suffixIcon: IconButton(
                      icon: const Icon(
                          // simpleUIController.isObscure.value
                          Icons.visibility),
                      onPressed: () {
                        // simpleUIController.isObscureActive();
                      },
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

                /// SignUp Button
                signUpButton(theme),
                SizedBox(
                  height: size.height * 0.03,
                ),

                /// Navigate To Login Screen
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    nameController.clear();
                    emailController.clear();
                    passwordController.clear();
                    _formKey.currentState?.reset();

                    // simpleUIController.isObscure.value = true;
                  },
                  child: RichText(
                    text: const TextSpan(
                      text: 'Already have an account?',
                      // style: kHaveAnAccountStyle(size),
                      children: [
                        TextSpan(
                          text: " Login",
                          // style: kLoginOrSignUpTextStyle(size),
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
    );
  }

  // SignUp Button
  Widget signUpButton(ThemeData theme) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.deepPurpleAccent),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        onPressed: () async {
          // Validate returns true if the form is valid, or false otherwise.
          if (_formKey.currentState!.validate()) {
            // ... Navigate To your Home Page
            final duration = await _registerServices.measureExecutionTime(() {
              _registerServices.registerWithEmailPassword(
                  emailController.value.text, passwordController.value.text);
            });
            await Future.delayed(
              duration,
            ).then((value) => Navigator.pop(context));
            // Navigator.pop(context);
          }
        },
        child: const Text('Sign up'),
      ),
    );
  }
}
