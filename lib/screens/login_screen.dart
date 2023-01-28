import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xfff0f1f5),
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(18),
        height: size.height,
        width: size.width,
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // SizedBox(
            //   width: 150,
            //   child: RichText(
            //       textAlign: TextAlign.center,
            //       text: const TextSpan(
            //           text: 'nexus',
            //           style: TextStyle(
            //             fontSize: 32,
            //             color: Colors.black87,
            //             fontWeight: FontWeight.bold,
            //           ),
            //           children: <TextSpan>[
            //             TextSpan(
            //                 text: ' RIT',
            //                 style: TextStyle(
            //                   color: Color(0xffff4590),
            //                 ))
            //           ])),
            // ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: size.width,
              height: size.height * .3,
              child: Image.asset('assets/rit_logo.png'),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 70),
              height: size.height * .3,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.2),
                      spreadRadius: 2,
                      blurRadius: 20,
                      offset: const Offset(0, 0),
                    )
                  ]),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  const Positioned(
                    top: 10,
                    left: 20,
                    child: Text(
                      'Login Here',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Positioned(
                      top: 50,
                      left: 20,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.mail_outline,
                                color: Colors.grey,
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 10),
                                width: 300,
                                child: TextField(
                                  controller: controller1,
                                  // onChanged: (value) {
                                  //   setState(() {
                                  //     controller1.text = value;
                                  //   });
                                  // },
                                  cursorColor: Colors.grey,
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'USN',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: size.width * .8,
                            child: const Divider(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      )),
                  Positioned(
                      top: 120,
                      left: 20,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.mail_outline,
                                color: Colors.grey,
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 10),
                                width: 300,
                                child: TextField(
                                  controller: controller2,
                                  // onChanged: (value) {
                                  //   setState(() {
                                  //     controller2.text = value;
                                  //   });
                                  // },
                                  // keyboardType: ,
                                  obscureText: true,
                                  cursorColor: Colors.grey,
                                  style: TextStyle(
                                    color: Colors.black54,
                                    // fontSize: 20,
                                    // letterSpacing: 1.4,
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Date of Birth...',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: size.width * .8,
                            child: const Divider(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      )),
                  Positioned(
                      top: 180,
                      left: 20,
                      child: SizedBox(
                        width: size.width * .8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Create Account',
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                            Text(
                              'Forgot Details',
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      )),
                  Positioned(
                    bottom: -30,
                    right: 30,
                    child: InkWell(
                      onTap: () {
                        if (controller1.text.isNotEmpty &&
                            controller2.text.isNotEmpty) {
                          Navigator.popAndPushNamed(context, '/home');
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        height: 60,
                        width: 60,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Color(0xff382743),
                                Color(0xffff4590),
                              ],
                              stops: [
                                0.0,
                                1.0
                              ],
                              begin: FractionalOffset.topLeft,
                              end: FractionalOffset.bottomRight),
                          // shape: StadiumBorder(),
                          shape: BoxShape.circle,
                          // borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Icon(
                          Icons.arrow_right_alt_rounded,
                          color: Colors.white,
                        ),

                        // child: Text(
                        //   'Login',
                        //   style: TextStyle(
                        //     color: Colors.white,
                        //     fontSize: 16,
                        //   ),
                        // ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
