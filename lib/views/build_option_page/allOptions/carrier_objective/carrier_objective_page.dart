import 'package:flutter/material.dart';
import 'package:resume_builder_app/utils/extentions.dart';
import 'package:resume_builder_app/utils/globals.dart';

class CarrierObjectivePage extends StatefulWidget {
  const CarrierObjectivePage({super.key});

  @override
  State<CarrierObjectivePage> createState() => _CarrierObjectivePageState();
}

class _CarrierObjectivePageState extends State<CarrierObjectivePage> {
  String? carrier;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Carrier Objective"),
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
                    //Carrier objective
                    TextFormField(
                      initialValue: Globals.carrier,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please enter carrier objective !!";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (val) {
                        Globals.carrier = val;
                      },
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        labelText: "Carrier objective",
                        hintText: "Description",
                        prefixIcon: const Icon(Icons.golf_course_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),

                    15.h,

                    //Current designation
                    TextFormField(
                      initialValue: Globals.designation,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please enter Designation !!";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (val) {
                        Globals.designation = val;
                      },
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        labelText: "Current designation",
                        hintText: "Flutter developer",
                        prefixIcon: const Icon(Icons.golf_course_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    40.h,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            formKey.currentState!.reset();

                            Globals.carrier = Globals.designation = null;
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
    ();
  }
}
