import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController userEdt = TextEditingController();
  final SpeechToText speechToTextInstance =SpeechToText();
  String recordedaudiotext="";


  void initializeSpeechtoText() async
  {
await speechToTextInstance.initialize();
setState(() {

});
  }

  void startListeningNow() async
  {
    FocusScope.of(context).unfocus();
    await speechToTextInstance.listen(onResult: onSpeechtoTextResult);

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
 void  onSpeechtoTextResult(SpeechRecognitionResult recognitionResult)
 {
   recordedaudiotext =recognitionResult.recognizedWords;
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        
      },
        child: Padding(padding: EdgeInsets.all(4),
            child: Image.asset("images/sound-off-icon-40944.png")),
      ) ,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 70,
        title: Text(
          "JARVIS",
          style: GoogleFonts.aboreto(
              fontSize: 28, color: const Color.fromARGB(255, 222, 22, 22)),
        ),
        actions: [
          Padding(padding: EdgeInsets.only(right: 4,top: 4),
          child: InkWell(
            onTap:   (){
                
              },
            child: Icon(Icons.chat,size: 40,color: Colors.white,),
          ),),
          Padding(padding: EdgeInsets.only(right: 4,left: 4),
            child: InkWell(
              onTap:   (){

              },
              child: Icon(Icons.image,size: 40,color: Colors.white,),
            ),)
        ],
        // centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 77, 234, 255),
                Color.fromARGB(172, 30, 148, 233)
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              InkWell(onTap: (){
          
              },
                child: Center(
                  child: Image.asset("images/Robot.jpg",width: 300,height: 300,),
                ),
              ),
              SizedBox(height: 50,),
              Row(
                children: [
                
                  Expanded(child: Padding(padding: EdgeInsets.only(left: 4.0),
                  child: TextField(
                    controller: userEdt,
                    decoration: InputDecoration(border: OutlineInputBorder(),
                        labelText: "How can i assist you ?"
          
                    ),
                  ),)),
                  SizedBox(width: 10,),
          
          
                  InkWell(
                      onTap: (){
          
                      },
          
                      child: AnimatedContainer(padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(shape: BoxShape.rectangle,
                          color: Colors.blue),
                          duration: Duration(milliseconds: 1000),
                      curve: Curves.bounceInOut,
                      child: Icon(Icons.send,color: Colors.white,size: 30,),))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
