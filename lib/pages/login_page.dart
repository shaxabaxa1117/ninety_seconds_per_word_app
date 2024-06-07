import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ninenty_second_per_word_app/fronted/components/snack_bar.dart';
import 'package:ninenty_second_per_word_app/fronted/style/app_colors.dart';
import 'package:ninenty_second_per_word_app/fronted/style/app_style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isHiddenPassword = true;
  TextEditingController emailTextInputController = TextEditingController();
  TextEditingController passwordTextInputController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailTextInputController.dispose();
    passwordTextInputController.dispose();

    super.dispose();
  }

  void togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  Future<void> login() async {
    final navigator = Navigator.of(context);

    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailTextInputController.text.trim(),
        password: passwordTextInputController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e.code);

      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        SnackBarService.showSnackBar(
          context,
          'Неправильный email или пароль. Повторите попытку',
          true,
        );
        return;
      } else {
        SnackBarService.showSnackBar(
          context,
          'Неизвестная ошибка! Попробуйте еще раз или обратитесь в поддержку.',
          true,
        );
        return;
      }
    }

    navigator.pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.headerColor,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.textColor,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome !',
                      style: AppStyle.fontStyle
                          .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'There you can enter to system',
                      style: AppStyle.fontStyle
                          .copyWith(color: AppColors.dividerColor),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      'assets/images/90.png',
                      width: 100,
                      height: 100,
                    ),
                    Text(
                      'SECONDS'.toUpperCase(),
                      style: AppStyle.fontStyle
                          .copyWith(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          'Email',
                          style: AppStyle.fontStyle
                              .copyWith(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      style: TextStyle(color: AppColors.dividerColor),
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      controller: emailTextInputController,
                      validator: (email) =>
                          email != null && !EmailValidator.validate(email)
                              ? 'Enter your mail'
                              : null,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        hintText: 'Enter mail',
                        hintStyle: AppStyle.fontStyle,
                        label: Icon(
                          Icons.mail,
                          color: AppColors.iconColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        Text(
                          'Password',
                          style: AppStyle.fontStyle
                              .copyWith(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      style: TextStyle(color: AppColors.dividerColor),
                      autocorrect: false,
                      controller: passwordTextInputController,
                      obscureText: isHiddenPassword,
                      validator: (value) => value != null && value.length < 6
                          ? 'Минимум 6 символов'
                          : null,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        hintText: 'Enter your password',
                        hintStyle: AppStyle.fontStyle,
                        label: Icon(
                          Icons.lock,
                          color: AppColors.iconColor,
                        ),
                        suffix: InkWell(
                          onTap: togglePasswordView,
                          child: Icon(
                            isHiddenPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: AppColors.textColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.of(context)
                              .pushNamed('/reset_password'),
                          child: Text(
                            'Forgot password?',
                            style: AppStyle.fontStyle
                                .copyWith(color: AppColors.textColor),
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.textColor),
                      onPressed: login,
                      child: Center(
                          child: Text(
                        'Sign in',
                        style: AppStyle.fontStyle.copyWith(
                            color: AppColors.backgroundColor,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Do\'nt have an accaunt?',
                      style: AppStyle.fontStyle,
                    ),
                    TextButton(
                      onPressed: () =>
                          Navigator.of(context).pushNamed('/signup'),
                      child: Text('Sing up',
                          style: AppStyle.fontStyle
                              .copyWith(color: AppColors.iconColor)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
