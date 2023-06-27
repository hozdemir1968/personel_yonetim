import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../configs/statics.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/sign_controller.dart';
import 'signin_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});
  static const String routeName = '/views/auth/signup';

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  SignController signController = Get.put(SignController());
  AuthController authController = Get.find();

  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController pass1Ctrl = TextEditingController();
  final TextEditingController pass2Ctrl = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameCtrl.dispose();
    emailCtrl.dispose();
    pass1Ctrl.dispose();
    pass2Ctrl.dispose();
  }

  void signupUser() async {
    await signController.signupUser(
      nameCtrl.text,
      emailCtrl.text,
      pass2Ctrl.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: const Text(
          signupAppbar,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: signupBody(context),
      ),
    );
  }

  Widget signupBody(BuildContext context) {
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
              controller: nameCtrl,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Hatalı isim!';
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: nameText,
              ),
            ),
            const SizedBox(height: 20),
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
              controller: pass1Ctrl,
              obscureText: true,
              validator: (value) {
                if (value!.isEmpty || value.length < 8) {
                  return 'Minimum sekiz karakter!';
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: passText,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: pass2Ctrl,
              obscureText: true,
              validator: (value) {
                if (value! != pass1Ctrl.text) {
                  return 'Şifreler uyuşmuyor!';
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
                signupUser();
              },
              child: const Text(
                signupButton,
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
                const Text(signupQuestion),
                InkWell(
                  onTap: () {
                    Get.offAndToNamed(SigninPage.routeName);
                  },
                  child: const Text(signupAnswer,
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
