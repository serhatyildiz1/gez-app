import 'package:flutter/material.dart';
import 'package:geziapp/AnaEkranveYanEkran/home_screen.dart';
import 'package:geziapp/GirisveKayit/signup.dart';
import 'package:geziapp/utils/database_helper.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // ignore: non_constant_identifier_names
  String? _KullaniciEmail;
  // ignore: non_constant_identifier_names
  String? _KullaniciSifre;
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  get _scaffoldKey => GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    var FormKey = GlobalKey<FormState>();
    // ignore: non_constant_identifier_names
    var FormKey2 = GlobalKey<FormState>();
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Login Page"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: SizedBox(
                    width: 200,
                    height: 150,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('assets/images/login.png')),
              ),
            ),
            Form(
              key: FormKey,
              child: Padding(
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  onSaved: (yeniDegerEmail) {
                    _KullaniciEmail = yeniDegerEmail;
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Enter valid email id as abc@gmail.com'),
                ),
              ),
            ),
            Form(
              key: FormKey2,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                  right: 15.0,
                  top: 15,
                  bottom: 0,
                ),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  onSaved: (yeniDegerSifre) {
                    _KullaniciSifre = yeniDegerSifre;
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter secure password'),
                ),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SignUp())),
              child: const Text(
                'New User? Create Account',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(
                onPressed: () async {
                  FormKey.currentState?.save();
                  FormKey2.currentState?.save();
                  var kullanici = await _databaseHelper.getLogin(
                      _KullaniciEmail!, _KullaniciSifre!);
                  if (kullanici == null) {
                    debugPrint("Giriş Başarısız");
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content:
                            Text("Eposta veya Sifre Yanlis, Tekrar Deneyin..."),
                        duration: Duration(seconds: 5),
                      ),
                    );
                  } else {
                    debugPrint("Kullanici Giris Yaptı: $_KullaniciEmail");
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(
                          kullanici: kullanici,
                        ),
                      ),
                    );
                  }
                },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
