import 'package:flutter/material.dart';

class FormSubmissionPage extends StatefulWidget {
  const FormSubmissionPage({super.key});

  @override
  FormSubmissionPageState createState() => FormSubmissionPageState();
}

class FormSubmissionPageState extends State<FormSubmissionPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String email = "";
  String password = "";

  void _submit() {
    // you can write your
    // own code according to
    // whatever you want to submit;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Validation"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'E-Mail'),
                    keyboardType: TextInputType.emailAddress,
                    onFieldSubmitted: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'Invalid email!';
                      }
                      return null;
                    },
                  ),
                  // this is where the
                  // input goes
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'password'),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty && value.length < 7) {
                        return 'Invalid password!';
                      }
                      return null;
                    },
                    onFieldSubmitted: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                  ),
                  ElevatedButton(
                    onPressed: _submit,
                    child: const Text("submit"),
                  ),
                ],
              ),
            ),
            // this is where
            // the form field
            // are defined
            const SizedBox(
              height: 20,
            ),
            Column(
              children: <Widget>[
                email.isEmpty ? const Text("No data") : Text(email),
                const SizedBox(
                  height: 10,
                ),
                password.isEmpty ? const Text("No Data") : Text(password),
              ],
            )
          ],
        ),
      ),
    );
  }
}
