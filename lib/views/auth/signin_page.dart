import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../configs/statics.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/sign_controller.dart';
import 'signup_page.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});
  static const String routeName = '/views/auth/signin';

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  SignController signController = Get.put(SignController());
  AuthController authController = Get.find();

  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailCtrl.dispose();
    passCtrl.dispose();
  }

  void signinUser() async {
    await signController.signinUser(
      emailCtrl.text,
      passCtrl.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: const Text(
          signinAppbar,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: signinBody(context),
      ),
    );
  }

  Widget signinBody(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
            Image.asset(
              logo,
              height: size.height * 0.25,
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: emailCtrl,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value!.isEmpty || !value.contains('@')) {
                  return 'Hatalı e-posta!';
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: emailText,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: passCtrl,
              obscureText: true,
              validator: (value) {
                if (value!.isEmpty || value.length < 8) {
                  return 'Şifre çok kısa!';
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: passText,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (!_formKey.currentState!.validate()) {
                  return;
                }
                signinUser();
              },
              child: const Text(
                signinButton,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(signinQuestion),
                InkWell(
                  onTap: () {
                    Get.offAndToNamed(SignupPage.routeName);
                  },
                  child: const Text(signinAnswer,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
