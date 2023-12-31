import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:neutic/game_screen.dart';
import 'package:neutic/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController player1Controller = TextEditingController();
  final TextEditingController player2Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          CachedNetworkImage(
            imageUrl:
                "https://w0.peakpx.com/wallpaper/697/811/HD-wallpaper-dark-vertical-anime-girls-artwork-anime-portrait-display.jpg",
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          ),
          SafeArea(
            child: Center(
                child: GlassMorphism(
              blur: 10,
              opacity: 0.5,
              height: double.infinity,
              width: double.infinity,
              child: Form(
                key: _formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(0.8),
                        child: GlowText(
                          "Tic Tac Toe",
                          glowColor: Colors.cyan.shade900,
                          blurRadius: 5,
                          offset: const Offset(4.0, 4.0),
                          style: GoogleFonts.antic(
                              textStyle: const TextStyle(
                                  fontSize: 70,
                                  color: Colors.blueAccent,
                                  shadows: [
                                Shadow(
                                    color: Colors.white,
                                    blurRadius: 20,
                                    offset: Offset(0.4, 0.4)),

                                    Shadow(
                                        color: Colors.blue,
                                        blurRadius: 10,
                                        offset: Offset(-0.8, -0.8))
                              ],fontWeight: FontWeight.bold),fontStyle: FontStyle.italic),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Enter Your Name",
                        style: GoogleFonts.belgrano(
                            textStyle: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 5,
                            ),
                          ],
                        )),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextFormField(
                          controller: player1Controller,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedErrorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueAccent),
                            ),
                            errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            hintText: "Player 1",
                            hintStyle: TextStyle(
                              color: Colors.white.withOpacity(0.4),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please Enter Your Name";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextFormField(
                          controller: player2Controller,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedErrorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueAccent),
                            ),
                            errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            hintText: "Player 2",
                            hintStyle: TextStyle(
                              color: Colors.white.withOpacity(0.4),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please Enter Your Name";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GameScreen(
                                    player1: player1Controller.text,
                                    player2: player2Controller.text,
                                  ),
                                ),
                              );
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.lightGreen,
                                  spreadRadius: 5,
                                  blurRadius: 10,
                                  offset: Offset(4.0, 4.0),
                                ),
                                BoxShadow(
                                  color: Colors.greenAccent,
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(-4.0, -4.0),
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 17, horizontal: 20),
                            child: Text(
                              "Start Game",
                              style: GoogleFonts.belgrano(
                                  textStyle: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                shadows: [
                                  BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 4.0,
                                    offset: Offset(0.6, 0.6),
                                  ),
                                  BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 20,
                                    offset: Offset(-0.6, -0.6),
                                  )
                                ],
                              )),
                            ),
                          )),
                    ]),
              ),
            )),
          ),
        ],
      ),
    );
  }
}
