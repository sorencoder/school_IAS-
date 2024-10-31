import 'package:flutter/material.dart';
import 'package:frontend/logic/provider/CounterProvider.dart';
import 'package:frontend/logic/provider/authentication.dart';
import 'package:frontend/logic/provider/passwordvisibiltyprovider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2C7865),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                child: ElevatedButton(
                    onPressed: () {
                      login(context);
                    },
                    child: const Text('Login')),
              )
            ],
            backgroundColor: const Color(0xffA1C398),
            elevation: 0,
            title: Row(
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset(
                    'assets/images/ias.jpg',
                    fit: BoxFit.scaleDown,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                const Column(
                  children: [
                    Text(
                      'Irvine Adventist School',
                      style: TextStyle(fontFamily: 'Ubuntu', fontSize: 25),
                    ),
                    Text(
                      'Gopalpur Ghatsila',
                      style: TextStyle(fontFamily: 'Ubuntu'),
                    )
                  ],
                ),
              ],
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<CounterProvier>(context, listen: false).increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<dynamic> login(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
            scrollable: true,
            title: const Center(
              child: Text(
                'Login',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            content: Form(
                child: Column(
              children: [
                SizedBox(
                  height: 250,
                  width: 250,
                  child: Image.asset('assets/images/Login-rafiki.png'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    controller: email,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(),
                      // disabledBorder: OutlineInputBorder(),
                      labelText: 'email',
                    ),
                    validator: (value) {
                      if (value!.isNotEmpty) {
                        return 'Your email';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Consumer<PasswordVisiblityProvider>(
                    builder: (context, value, child) {
                      return TextFormField(
                        controller: password,
                        obscureText: value.isvisible,
                        decoration: InputDecoration(
                            suffixIcon: InkWell(
                                onTap: () {
                                  Provider.of<PasswordVisiblityProvider>(
                                          context,
                                          listen: false)
                                      .setVisiblity();
                                },
                                child: value.isvisible
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off)),
                            labelText: 'password',
                            focusedBorder: const OutlineInputBorder(),
                            enabledBorder: const OutlineInputBorder()),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                      onPressed: () {
                        Provider.of<Authentication>(context, listen: false)
                            .login(email.text.trim(), password.text.trim());
                      },
                      child: const Text('Login')),
                )
              ],
            ))));
  }
}
