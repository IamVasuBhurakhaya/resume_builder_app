import 'package:flutter/material.dart';
import 'package:resume_builder_app/utils/extentions.dart';
import 'package:resume_builder_app/utils/globals.dart';

class PersonalDetailPage extends StatefulWidget {
  const PersonalDetailPage({super.key});

  @override
  State<PersonalDetailPage> createState() => _PersonalDetailPageState();
}

class _PersonalDetailPageState extends State<PersonalDetailPage> {
  String? nationality;

  List<String> availableLanguages = [
    "Gujarati",
    "English",
    "Hindi",
    "German",
    "French",
    "Spanish",
  ];
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
            "Personal detail",
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
                    //date of birth
                    TextFormField(
                      initialValue: Globals.dob,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please enter Date of Birth !!";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (val) {
                        Globals.dob = val;
                      },
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        labelText: "DD/MM/YYYY",
                        hintText: "Enter date of birth",
                        prefixIcon: const Icon(Icons.calendar_month_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    15.h,

                    //gender
                    const Text(
                      "Select Your Gender",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    RadioListTile(
                      title: const Text(
                        "Male",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      value: "Male",
                      groupValue: Globals.gender,
                      onChanged: (val) {
                        Globals.gender = val;
                        setState(() {});
                      },
                    ),
                    RadioListTile(
                      title: const Text(
                        "Female",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      value: "Female",
                      groupValue: Globals.gender,
                      onChanged: (val) {
                        Globals.gender = val;
                        setState(() {});
                      },
                    ),

                    //language
                    const Text(
                      "Select Languages",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    ...availableLanguages.map(
                      (e) => CheckboxListTile(
                        value: Globals.languages.contains(e),
                        title: Text(
                          e,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (val) {
                          if (val!) {
                            Globals.languages.add(e);
                          } else {
                            Globals.languages.remove(e);
                          }
                          setState(() {});
                        },
                      ),
                    ),

                    //maritial Status
                    const Text(
                      "Select Your Maritial Status",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    RadioListTile(
                      title: const Text(
                        "Married",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      value: "Married",
                      groupValue: Globals.maritial,
                      onChanged: (val) {
                        Globals.maritial = val;
                        setState(() {});
                      },
                    ),
                    RadioListTile(
                      title: const Text(
                        "Single",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      value: "Single",
                      groupValue: Globals.maritial,
                      onChanged: (val) {
                        Globals.maritial = val;
                        setState(() {});
                      },
                    ),

                    //Nationality
                    TextFormField(
                      initialValue: Globals.nationality,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please enter Nationality !!";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (val) {
                        Globals.nationality = val;
                      },
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        labelText: "Nationality",
                        hintText: "Enter Country",
                        prefixIcon: const Icon(Icons.nature_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
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
