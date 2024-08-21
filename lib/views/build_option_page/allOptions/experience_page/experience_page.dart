import 'package:flutter/material.dart';
import 'package:resume_builder_app/utils/extentions.dart';
import 'package:resume_builder_app/utils/globals.dart';

class ExperiencePage extends StatefulWidget {
  const ExperiencePage({super.key});

  @override
  State<ExperiencePage> createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? company, position;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Personal detail"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Color(0xffE9EDC9),
              ),
              child: Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //Company name
                    TextFormField(
                      initialValue: Globals.company,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please enter company name !!";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (val) {
                        Globals.company = val;
                      },
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        labelText: "Enter company name",
                        hintText: "Infosys limited",
                        prefixIcon: const Icon(Icons.apartment),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    15.h,

                    //Position
                    TextFormField(
                      initialValue: Globals.position,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please enter position !!";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (val) {
                        Globals.position = val;
                      },
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        labelText: "Enter position",
                        hintText: "Hiring manager",
                        prefixIcon: const Icon(Icons.person_2_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    15.h,

                    30.h,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            formKey.currentState!.reset();

                            Globals.nationality = Globals.dob = null;
                            setState(() {});
                          },
                          child: const Text("RESET"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            bool validated = formKey.currentState!.validate();

                            if (validated) {
                              formKey.currentState!.save();

                              SnackBar snackBar = const SnackBar(
                                content: Text("Form saved successfully...!!"),
                                backgroundColor: Colors.green,
                                behavior: SnackBarBehavior.floating,
                              );

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else {
                              SnackBar snackBar = const SnackBar(
                                content: Text("Form submission failed...!!"),
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
        ),
      ),
    );
  }
}
