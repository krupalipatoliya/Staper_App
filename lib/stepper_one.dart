import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class StapperOnePage extends StatefulWidget {
  StapperOnePage({Key? key}) : super(key: key);

  @override
  State<StapperOnePage> createState() => _StapperOnePageState();
}

class _StapperOnePageState extends State<StapperOnePage> {
  int initialIndex = 0;

  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  tileMode: TileMode.clamp,
                  stops: [0.0, 1.0],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(0.5, 0.0),
                  colors: [Colors.pinkAccent, Colors.blueAccent])),
        ),
        leading: const Icon(Icons.arrow_back),
        title: const Text(
          "EDIT PROFILE",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Stepper(
        onStepContinue: () {
          setState(() {
            if (initialIndex < 10) {
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
        onStepTapped: (val) {
          setState(() {
            initialIndex = val;
          });
        },
        type: StepperType.vertical,
        physics: const ClampingScrollPhysics(),
        currentStep: initialIndex,
        controlsBuilder: (context, controlDetails) {
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                if (initialIndex < 10) ...[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 10,
                      ),
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
                      setState(() {});
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
                        horizontal: 25,
                        vertical: 10,
                      ),
                    ),
                    onPressed: controlDetails.onStepCancel,
                    child: const Text("Cancle"),
                  ),
                ],
              ],
            ),
          );
        },
        steps: [
          Step(
            isActive: (initialIndex >= 0) ? true : false,
            title: Text(
              "Profile Picture",
              style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 4,
                ),
                InkWell(
                  onTap: () async {
                    final ImagePicker _picker = ImagePicker();

                    image =
                        await _picker.pickImage(source: ImageSource.gallery);
                    log(image!.path.toString(), name: "Image");

                    setState(() {});
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 50,
                    child: Center(
                      child: image == null
                          ? const Text(
                              "ADD IMAGE",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.7),
                                  shape: BoxShape.circle,
                                ),
                                child: Image.file(
                                  File(image!.path),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Step(
            isActive: (initialIndex >= 1) ? true : false,
            title: Text(
              "Name",
              style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            content:
                ComanColumnForStapper(icon: Icons.person, text: "Enter Name"),
          ),
          Step(
            isActive: (initialIndex >= 2) ? true : false,
            title: Text(
              "Phone",
              style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            content:
                ComanColumnForStapper(icon: Icons.phone, text: "Enter number"),
          ),
          Step(
            isActive: (initialIndex >= 3) ? true : false,
            title: Text(
              "Email",
              style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            content:
                ComanColumnForStapper(icon: Icons.email, text: "Enter email"),
          ),
          Step(
            isActive: (initialIndex >= 4) ? true : false,
            title: Text(
              "DOB",
              style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: ComanColumnForStapper(
                icon: Icons.room_service, text: "Enter DOB"),
          ),
          Step(
            isActive: (initialIndex >= 5) ? true : false,
            title: Text(
              "Gender",
              style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            content:
                ComanColumnForStapper(icon: Icons.male, text: "Enter gender"),
          ),
          Step(
            isActive: (initialIndex >= 6) ? true : false,
            title: Text(
              "Current Location",
              style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: ComanColumnForStapper(
                icon: Icons.gamepad, text: "Enter location"),
          ),
          Step(
            isActive: (initialIndex >= 7) ? true : false,
            title: Text(
              "Nationality",
              style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: ComanColumnForStapper(
                icon: Icons.map, text: "Enter nationality"),
          ),
          Step(
            isActive: (initialIndex >= 8) ? true : false,
            title: Text(
              "Religion",
              style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            content:
                ComanColumnForStapper(icon: Icons.map, text: "Enter religion"),
          ),
          Step(
            isActive: (initialIndex >= 9) ? true : false,
            title: Text(
              "Languages",
              style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: ComanColumnForStapper(
                icon: Icons.language, text: "Enter language"),
          ),
          Step(
            isActive: (initialIndex >= 10) ? true : false,
            state: StepState.disabled,
            title: Text(
              "Biography",
              style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: ComanColumnForStapper(icon: Icons.security, text: "Enter"),
          ),
        ],
      ),
    );
  }
}

class ComanColumnForStapper extends StatelessWidget {
  ComanColumnForStapper({Key? key, required this.icon, this.text})
      : super(key: key);

  @override
  String? text;
  IconData? icon;

  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.grey),
            const SizedBox(
              width: 15,
            ),
            SizedBox(
              height: 30,
              width: 237,
              child: TextFields(hintText: text),
            ),
          ],
        ),
      ],
    );
  }
}

class TextFields extends StatelessWidget {
  TextFields({
    Key? key,
    required this.hintText,
    this.controller,
    this.lableText,
    this.textInputType,
    this.maxLines,
  }) : super(key: key);

  String? hintText;
  String? lableText;
  TextEditingController? controller;
  TextInputType? textInputType;
  int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.next,
      maxLines: maxLines,
      keyboardType: textInputType,
      controller: controller,
      decoration: InputDecoration(
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
