import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resume_builder_app/utils/extentions.dart';
import 'package:resume_builder_app/utils/globals.dart';

class ContactInfoPage extends StatefulWidget {
  const ContactInfoPage({super.key});

  @override
  State<ContactInfoPage> createState() => _ContactInfoPageState();
}

class _ContactInfoPageState extends State<ContactInfoPage> {
  int index = 0;
  bool hide = true;

  String? name, contact, email;

  // TextEditingController nameController = TextEditingController();
  // TextEditingController contactController = TextEditingController();
  // TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  static final RegExp emailRedExp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );

  void setIndex(int i) {
    index = i;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Contact Info"),
        ),
        body: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setIndex(0);
                      },
                      child: Container(
                        height: 60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xffCCD5AE),
                          border: Border(
                            bottom: BorderSide(
                              width: index == 0 ? 5 : 0,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        child: const Text(
                          "Contact",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setIndex(1);
                      },
                      child: Container(
                        height: 60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xffCCD5AE),
                          border: Border(
                            bottom: BorderSide(
                              width: index == 1 ? 5 : 0,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        child: const Text(
                          "Photo",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              10.h,
              //contact
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: IndexedStack(
                    index: index,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0xffE9EDC9),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: SingleChildScrollView(
                          child: Form(
                            key: formKey,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextFormField(
                                  initialValue: Globals.name,
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Please enter name !!";
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (val) {
                                    Globals.name = val;
                                  },
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    labelText: "Name",
                                    hintText: "Enter name",
                                    prefixIcon: const Icon(Icons.person),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                                15.h,
                                TextFormField(
                                  initialValue: Globals.contact,
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Please enter number !!";
                                    } else if (val.length < 10) {
                                      return "Contact numbr must be of 10 digit !!";
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (val) {
                                    Globals.contact = val;
                                  },
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.phone,
                                  maxLength: 10,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  decoration: InputDecoration(
                                    labelText: "Contact",
                                    hintText: "Enter number",
                                    prefixIcon: const Icon(Icons.phone),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                                15.h,
                                TextFormField(
                                  initialValue: Globals.email,
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Please enter email !!";
                                    } else if (!emailRedExp.hasMatch(val)) {
                                      return "Please enter a valid email address !!";
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (val) {
                                    Globals.email = val;
                                  },
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    labelText: "Email",
                                    hintText: "Enter email",
                                    prefixIcon: const Icon(Icons.email),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                                30.h,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        formKey.currentState!.reset();

                                        Globals.email = Globals.contact =
                                            Globals.name = null;
                                        setState(() {});
                                      },
                                      child: Text("RESET"),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        bool validated =
                                            formKey.currentState!.validate();

                                        if (validated) {
                                          formKey.currentState!.save();

                                          SnackBar snackBar = const SnackBar(
                                            content: Text(
                                                "Form saved successfully...!!"),
                                            backgroundColor: Colors.green,
                                            behavior: SnackBarBehavior.floating,
                                          );

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        } else {
                                          SnackBar snackBar = const SnackBar(
                                            content: Text(
                                                "Form submission failes...!!"),
                                            backgroundColor: Colors.red,
                                            behavior: SnackBarBehavior.floating,
                                          );

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        }
                                      },
                                      child: const Text("SAVE"),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      //photo page----
                      Container(
                        decoration: const BoxDecoration(
                            color: Color(0xffCCD5AE),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            )),
                        padding: const EdgeInsets.all(16),
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 0.25,
                        alignment: Alignment.center,
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 60,
                              foregroundImage: Globals.image != null
                                  ? FileImage(Globals.image!)
                                  : null,
                              child: const Text("Add Image"),
                            ),
                            FloatingActionButton.small(
                              onPressed: () async {
                                ImagePicker imagePicker = ImagePicker();

                                XFile? file = await imagePicker.pickImage(
                                    source: ImageSource.camera);

                                if (file != null) {
                                  Globals.image = File(file.path);
                                  setState(() {});
                                }
                              },
                              child: const Icon(Icons.camera),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
