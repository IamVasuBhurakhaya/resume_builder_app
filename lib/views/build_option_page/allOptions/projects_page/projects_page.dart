import 'package:flutter/material.dart';
import 'package:resume_builder_app/utils/extentions.dart';
import 'package:resume_builder_app/utils/globals.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<TextEditingController> projectControllers = [];

  @override
  void initState() {
    if (Globals.projectTechnologies.isEmpty) {
      projectControllers = List.generate(
        2,
        (i) => TextEditingController(),
      );
    } else if (Globals.projectTechnologies.length < 2) {
      Globals.projectTechnologies.forEach((e) {
        projectControllers.add(
          TextEditingController(text: e),
        );
      });
      projectControllers.add(TextEditingController());
    } else {
      Globals.projectTechnologies.forEach((e) {
        projectControllers.add(
          TextEditingController(text: e),
        );
      });
    }

    super.initState();
  }

  @override
  void dispose() {
    Globals.projectTechnologies.clear();
    for (int i = 0; i < projectControllers.length; i++) {
      if (projectControllers[i].text.isNotEmpty) {
        Globals.projectTechnologies.add(projectControllers[i].text);
      }
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Projects ",
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
                    //Project title
                    TextFormField(
                      initialValue: Globals.projectTitle,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please project title !!";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (val) {
                        Globals.projectTitle = val;
                      },
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        labelText: "Enter project title",
                        hintText: "business app",
                        prefixIcon: const Icon(Icons.polymer_rounded),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    15.h,

                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Enter Project Technologies",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 22,
                              color: Colors.black54),
                        ),
                        Column(
                          children: List.generate(
                            projectControllers.length,
                            (index) => Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: projectControllers[index],
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    projectControllers[index].clear();
                                    projectControllers.removeAt(index);
                                    setState(() {});
                                  },
                                  icon: const Icon(Icons.delete_outline),
                                ),
                              ],
                            ),
                          ),
                        ),
                        30.h,
                        ElevatedButton.icon(
                          onPressed: () {
                            projectControllers.add(TextEditingController());
                            setState(() {});
                          },
                          icon: const Icon(Icons.add),
                          label: const Text("Add"),
                        ),
                      ],
                    ),
                    15.h,

                    //Project role
                    TextFormField(
                      initialValue: Globals.projectRoles,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please enter your role !!";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (val) {
                        Globals.projectRoles = val;
                      },
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        labelText: "Designation",
                        hintText: "Enter project role",
                        prefixIcon: const Icon(Icons.group),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    15.h,

                    //Project Description
                    TextFormField(
                      initialValue: Globals.projectDescription,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please enter project description !!";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (val) {
                        Globals.projectDescription = val;
                      },
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        labelText: "description",
                        hintText: "Enter project description",
                        prefixIcon: const Icon(Icons.book_outlined),
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

                            Globals.projectDescription = Globals.projectRoles =
                                Globals.projectTitle = null;
                            Globals.projectTechnologies = [];
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
