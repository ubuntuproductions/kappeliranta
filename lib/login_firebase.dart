import 'package:flutter/material.dart';
import 'package:nowa_runtime/nowa_runtime.dart';
import 'package:kappeliranta/firebase/firebase.dart';
import 'package:kappeliranta/models/get_user_info_model1.dart';
import 'package:kappeliranta/api/aitable.api.dart';
import 'package:kappeliranta/main.dart';
import 'package:kappeliranta/user_info.dart';
import 'package:kappeliranta/home.dart';
import 'package:kappeliranta/reset_password_firebase.dart';

@NowaGenerated({'auto-width': 500.0, 'auto-height': 973.0})
class LoginFirebase extends StatefulWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const LoginFirebase({super.key});

  @override
  State<LoginFirebase> createState() {
    return _LoginFirebaseState();
  }
}

@NowaGenerated()
class _LoginFirebaseState extends State<LoginFirebase> {
  String? tempUserEmail = '';

  bool loader = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController loginEmail = TextEditingController();

  TextEditingController loginPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          alignment: const Alignment(0.0, 0.0),
          children: [
            Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 24.0,
                  right: 24.0,
                  top: 24.0,
                  bottom: 24.0,
                ),
                child: Form(
                  key: formKey,
                  child: NFlex(
                    direction: Axis.vertical,
                    spacing: 48.0,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FlexSizedBox(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 300.0),
                          child: NFlex(
                            direction: Axis.vertical,
                            spacing: 22.0,
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              FlexSizedBox(
                                width: double.infinity,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: '',
                                    contentPadding: EdgeInsets.only(
                                      left: 10.0,
                                      right: 10.0,
                                      top: 10.0,
                                      bottom: 10.0,
                                    ),
                                    prefixIcon: Icon(
                                      IconData(61042,
                                          fontFamily: 'MaterialIcons'),
                                      color: Color(0xff000000),
                                      size: 15.0,
                                    ),
                                    labelText: 'Email',
                                  ),
                                  validator: (value) {
                                    if (value == null || value!.isEmpty) {
                                      return 'Field is required';
                                    }
                                    return null;
                                  },
                                  controller: loginEmail,
                                ),
                              ),
                              FlexSizedBox(
                                width: double.infinity,
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: '',
                                    contentPadding: EdgeInsets.only(
                                      left: 10.0,
                                      right: 10.0,
                                      top: 10.0,
                                      bottom: 10.0,
                                    ),
                                    prefixIcon: Icon(
                                      IconData(59079,
                                          fontFamily: 'MaterialIcons'),
                                      color: Color(0xff000000),
                                      size: 15.0,
                                    ),
                                    labelText: 'Password',
                                  ),
                                  validator: (value) {
                                    if (value == null || value!.isEmpty) {
                                      return 'Field is required';
                                    }
                                    return null;
                                  },
                                  controller: loginPassword,
                                ),
                              ),
                              FlexSizedBox(
                                width: double.infinity,
                                height: 36.0,
                                child: CustomButton(
                                  onPressed: () {
                                    loader = true;
                                    setState(() {});
                                    FirebaseService()
                                        .signInWithEmailAndPassword(
                                            loginEmail.text, loginPassword.text)
                                        .then((value) async {
                                      bool isVerified = FirebaseService()
                                              .currentUser
                                              ?.emailVerified ??
                                          false;
                                      if (isVerified) {
                                        tempUserEmail = FirebaseService()
                                            .currentUser
                                            ?.email;
                                        final userInfoApi = await Aitable()
                                            .getUserInfo(
                                                userEmail: tempUserEmail);
                                        sharedPrefs.setString(
                                            'userEmail', tempUserEmail!);
                                        UserInfo.of(context, listen: false)
                                                .userName =
                                            sharedPrefs.getString('userEmail');
                                        sharedPrefs.setString(
                                            'userName',
                                            userInfoApi!.data!.records![0]!
                                                .fields!.firstName!);
                                        UserInfo.of(context, listen: false)
                                                .userName =
                                            sharedPrefs.getString('userName');
                                        sharedPrefs.setString(
                                            'userRole',
                                            userInfoApi!.data!.records![0]!
                                                .fields!.category!);
                                        UserInfo.of(context, listen: false)
                                                .userRole =
                                            sharedPrefs.getString('userRole');
                                        sharedPrefs.setString(
                                            'companyName',
                                            userInfoApi!.data!.records![0]!
                                                .fields!.companyName!);
                                        UserInfo.of(context, listen: false)
                                                .userCompany =
                                            sharedPrefs
                                                .getString('companyName');
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const Home()),
                                                (route) => false);
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                          content: Text(
                                            'Email not verified. Please check your inbox and verify your email :)',
                                          ),
                                        ));
                                      }
                                    }, onError: (error) {
                                      loader = false;
                                      setState(() {});
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                          'error: ${error}',
                                        ),
                                      ));
                                    });
                                  },
                                  color: const Color(0xff2e2e2e),
                                  child: const Text(
                                    'Login',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Color(0xffffffff)),
                                  ),
                                ),
                              ),
                              FlexSizedBox(
                                width: 200.0,
                                height: 4.0,
                                child: Visibility(
                                  visible: loader,
                                  child: LinearProgressIndicator(
                                    borderRadius: BorderRadius.circular(0.0),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      FlexSizedBox(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 350.0),
                          child: NFlex(
                            direction: Axis.vertical,
                            spacing: 24.0,
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              FlexSizedBox(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ResetPasswordFirebase()));
                                  },
                                  child: Text(
                                    'Do you need to reset your password?',
                                    style: TextStyle(
                                        decoration: TextDecoration.none),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
