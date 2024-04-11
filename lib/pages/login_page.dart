import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/auth/auth_service.dart';
import 'package:flutter_application_2/pages/dashboard_page.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  static const String routerName = '/login';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _errMsg = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey, 
            child: ListView(
          padding: const EdgeInsets.all(24.0),
          shrinkWrap: true,
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              decoration: const InputDecoration(
                filled: true,
                prefixIcon: Icon(Icons.email),
                labelText: 'Email Address',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                filled: true,
                prefixIcon: Icon(Icons.password),
                labelText: 'Password (at least 6 characters)',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Provide a valid password';
                }
                return null;
              },
            ),
            ElevatedButton(onPressed: _authenticate, child: const Text('Login as Admin')),
            Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(_errMsg, style: const TextStyle(color: Colors.red, fontSize: 18)))
          ],
        )),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _authenticate() async {
    if(_formKey.currentState!.validate()){
      EasyLoading.show(status: 'Please wait');
      final email = _emailController.text;
      final password = _passwordController.text;
      try{
        final status = await AuthService.loginAdmin(email, password);
        EasyLoading.dismiss();
        if(status){
          context.goNamed(DashBoardPage.routerName);
        }else{
          await AuthService.logout();
          setState(() {
            _errMsg = 'This is not an Admin account';
          });
        }
      } on FirebaseAuthException catch(e){
        _errMsg = e.toString();
        EasyLoading.dismiss();
        setState(() {
          _errMsg = e.message!;
        });
      }
    }
  }
}
