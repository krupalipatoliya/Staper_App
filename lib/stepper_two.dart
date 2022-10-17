import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stapper1/lastScreen.dart';



class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int initialIndex = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(
          "Stepper App",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Theme(
        data: ThemeData(
          colorScheme: Theme.of(context).colorScheme.copyWith(
            primary: Colors.redAccent,
          ),
        ),
        child: Stepper(
          type: StepperType.vertical,
          physics: const ClampingScrollPhysics(),
          currentStep: initialIndex,
          onStepTapped: (val) {
            setState(() {
              initialIndex = val;
            });
          },
          steps: [
            Step(
              title: Text(
                "Sign Up",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 4,
                  ),
                  TextFields(
                    hintText: "Enter Name",
                    lableText: "Name",
                    prefixIcon: Icons.person_outline,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFields(
                    hintText: "Enter Email",
                    lableText: "Email-id",
                    prefixIcon: Icons.mail_outline,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFields(
                    hintText: "Enter Password",
                    lableText: "Password",
                    prefixIcon: Icons.lock_outline,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFields(
                    hintText: "Enter Password",
                    lableText: "Confirm Password",
                    prefixIcon: Icons.lock_outline,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
              isActive: (initialIndex >= 0) ? true : false,
            ),
            Step(
              title: Text(
                "Login",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 4,
                  ),
                  TextFields(
                    hintText: "Enter Username",
                    lableText: "Username",
                    prefixIcon: Icons.person_outline,
                  ),
                  const SizedBox(height: 20),
                  TextFields(
                    hintText: "Enter Password",
                    lableText: "Password",
                    prefixIcon: Icons.lock_outline,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
              isActive: (initialIndex >= 1) ? true : false,
            ),
            Step(
              title: Text(
                "Done",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              state: StepState.complete,
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [],
              ),
              isActive: (initialIndex >= 2) ? true : false,
            ),
          ],
          onStepContinue: () {
            setState(() {
              if (initialIndex < 5) {
                initialIndex++;
              }
            });
          },
          onStepCancel: () {
            setState(() {
              if (initialIndex > 0) {
                initialIndex--;
              }
            });
          },
          controlsBuilder: (context, controlDetails) {
            return (initialIndex == 2)
                ? SizedBox()
                : Row(
              children: [
                if (initialIndex < 2) ...[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                    ),
                    onPressed: controlDetails.onStepContinue,
                    child: const Text("Next"),
                  ),
                ] else ...[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                          const SubmitFromPage(),
                        ),
                      );
                    },
                    child: const Text("Save"),
                  ),
                ],
                const SizedBox(
                  width: 20,
                ),
                if (initialIndex > 0) ...[
                  OutlinedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 10),
                    ),
                    onPressed: controlDetails.onStepCancel,
                    child: const Text("Cancle"),
                  ),
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}

class TextFields extends StatelessWidget {
  TextFields(
      {Key? key,
        required this.hintText,
        this.controller,
        this.lableText,
        this.textInputType,
        this.maxLines,
        this.prefixIcon})
      : super(key: key);

  String? hintText;
  String? lableText;
  TextEditingController? controller;
  TextInputType? textInputType;
  int? maxLines;
  IconData? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.next,
      maxLines: maxLines,
      keyboardType: textInputType,
      controller: controller,
      decoration: InputDecoration(

        prefixIcon: Icon(prefixIcon),
        hintText: hintText,
        labelText: lableText,
        hintStyle: TextStyle(
          color: Colors.grey.shade400,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade400,
            width: 2,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade400,
            width: 2,
          ),
        ),
      ),
    );
  }
}