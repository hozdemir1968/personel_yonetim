import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:personel_yonetim/controllers/personel_controller.dart';
import 'package:personel_yonetim/models/personel_req_model.dart';
import '../../controllers/auth_controller.dart';

class PersonelAddPage extends StatefulWidget {
  const PersonelAddPage({super.key});
  static const String routeName = '/views/personels/personelAdd';

  @override
  State<PersonelAddPage> createState() => _PersonelAddPageState();
}

class _PersonelAddPageState extends State<PersonelAddPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  PersonelController personelController = Get.find();
  AuthController authController = Get.find();

  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController surnameCtrl = TextEditingController();
  final TextEditingController citizenNoCtrl = TextEditingController();
  final TextEditingController genderCtrl = TextEditingController();
  final TextEditingController phoneCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController birthDateCtrl = TextEditingController();
  final TextEditingController employmentDateCtrl = TextEditingController();
  final TextEditingController dismissallDateCtrl = TextEditingController();
  final TextEditingController sgkTypeCtrl = TextEditingController();
  final TextEditingController departmentCtrl = TextEditingController();
  final TextEditingController dutyCtrl = TextEditingController();
  final TextEditingController ibanCtrl = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameCtrl.dispose();
    surnameCtrl.dispose();
    citizenNoCtrl.dispose();
    genderCtrl.dispose();
    phoneCtrl.dispose();
    emailCtrl.dispose();
    birthDateCtrl.dispose();
    employmentDateCtrl.dispose();
    dismissallDateCtrl.dispose();
    sgkTypeCtrl.dispose();
    departmentCtrl.dispose();
    dutyCtrl.dispose();
    ibanCtrl.dispose();
  }

  void savePersonel() async {
    PersonelReqModel personelReqModel = PersonelReqModel();
    personelReqModel.name = nameCtrl.text;
    personelReqModel.surname = surnameCtrl.text;
    personelReqModel.citizenNo = citizenNoCtrl.text;
    personelReqModel.gender = genderCtrl.text;
    personelReqModel.phone = phoneCtrl.text;
    personelReqModel.email = emailCtrl.text;
    personelReqModel.birthDate = DateTime.parse(birthDateCtrl.text);
    personelReqModel.employmentDate = DateTime.parse(employmentDateCtrl.text);
    if (dismissallDateCtrl.text == '') {
      personelReqModel.dismissalDate = null;
    } else {
      personelReqModel.dismissalDate = DateTime.parse(dismissallDateCtrl.text);
    }
    personelReqModel.sgkType = sgkTypeCtrl.text;
    personelReqModel.department = departmentCtrl.text;
    personelReqModel.duty = dutyCtrl.text;
    personelReqModel.iban = ibanCtrl.text;
    await personelController.addPersonel(personelReqModel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personel Ekle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: personelAddBody(context),
      ),
    );
  }

  Widget personelAddBody(BuildContext context) {
    //var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
            TextFormField(
              controller: nameCtrl,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Boş bırakılamaz!';
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: "İsim",
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: surnameCtrl,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Boş bırakılamaz!';
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: "Soyisim",
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: citizenNoCtrl,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Boş bırakılamaz!';
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: "TC No",
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: genderCtrl,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Boş bırakılamaz!';
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: "Cinsiyet",
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: phoneCtrl,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Boş bırakılamaz!';
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: "Telefon",
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
                hintText: "Eposta",
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: birthDateCtrl,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Boş bırakılamaz!';
                }
                return null;
              },
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1950),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null) {
                  birthDateCtrl.text = DateFormat('yyyy-MM-dd').format(pickedDate);
                } else {
                  birthDateCtrl.text = '';
                }
              },
              decoration: const InputDecoration(
                hintText: "Doğum tarihi",
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: employmentDateCtrl,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Boş bırakılamaz!';
                }
                return null;
              },
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1950),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null) {
                  employmentDateCtrl.text = DateFormat('yyyy-MM-dd').format(pickedDate);
                } else {
                  employmentDateCtrl.text = '';
                }
              },
              decoration: const InputDecoration(
                hintText: "İşe giriş tarihi",
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: dismissallDateCtrl,
              keyboardType: TextInputType.text,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1950),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null) {
                  dismissallDateCtrl.text = DateFormat('yyyy-MM-dd').format(pickedDate);
                } else {
                  dismissallDateCtrl.text = '';
                }
              },
              decoration: const InputDecoration(
                hintText: "İşten çıkış tarihi",
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: sgkTypeCtrl,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Boş bırakılamaz!';
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: "SGK Türü",
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: departmentCtrl,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Boş bırakılamaz!';
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: "Bölüm",
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: dutyCtrl,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Boş bırakılamaz!';
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: "Görev",
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: ibanCtrl,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Boş bırakılamaz!';
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: "IBAN",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (!_formKey.currentState!.validate()) {
                  return;
                }
                savePersonel();
                //Get.toNamed(PersonelListPage.routeName);
                Get.back();
              },
              child: const Text('Kaydet'),
            ),
          ],
        ),
      ),
    );
  }
}
