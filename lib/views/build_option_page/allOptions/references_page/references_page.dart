import 'package:flutter/material.dart';
import 'package:resume_builder_app/utils/extentions.dart';
import 'package:resume_builder_app/utils/globals.dart';

class ReferencesPage extends StatefulWidget {
  const ReferencesPage({super.key});

  @override
  State<ReferencesPage> createState() => _ReferencesPageState();
}

class _ReferencesPageState extends State<ReferencesPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Carrier Objective",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
              letterSpacing: 0.8,
            ),
          ),
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
                    //Referrence name
                    TextFormField(
                      initialValue: Globals.refName,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please enter referrence name!!";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (val) {
                        Globals.refName = val;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: "Reference name",
                        hintText: "name",
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    15.h,

                    //designation
                    TextFormField(
                      initialValue: Globals.refDesignation,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please enter designation!!";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (val) {
                        Globals.refDesignation = val;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: "Designation",
                        hintText: "Manager",
                        prefixIcon: const Icon(Icons.balance),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    15.h,

                    //organization
                    TextFormField(
                      initialValue: Globals.refOrganization,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please enter organization !!";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (val) {
                        Globals.refOrganization = val;
                      },
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        labelText: "Organization",
                        hintText: "Company name",
                        prefixIcon: const Icon(Icons.apartment),
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

                            Globals.refOrganization =
                                Globals.refDesignation = Globals.refName = null;
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
