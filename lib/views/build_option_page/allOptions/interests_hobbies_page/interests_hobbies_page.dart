import 'package:flutter/material.dart';
import 'package:resume_builder_app/utils/extentions.dart';
import 'package:resume_builder_app/utils/globals.dart';

class InterestsHobbiesPage extends StatefulWidget {
  const InterestsHobbiesPage({super.key});

  @override
  State<InterestsHobbiesPage> createState() => _InterestsHobbiesPageState();
}

class _InterestsHobbiesPageState extends State<InterestsHobbiesPage> {
  List<TextEditingController> interestsHobbiesControllers = [];

  @override
  void initState() {
    if (Globals.interestsHobbies.isEmpty) {
      interestsHobbiesControllers = List.generate(
        2,
        (i) => TextEditingController(),
      );
    } else if (Globals.interestsHobbies.length < 2) {
      Globals.interestsHobbies.forEach((e) {
        interestsHobbiesControllers.add(
          TextEditingController(text: e),
        );
      });
      interestsHobbiesControllers.add(TextEditingController());
    } else {
      Globals.interestsHobbies.forEach((e) {
        interestsHobbiesControllers.add(
          TextEditingController(text: e),
        );
      });
    }

    super.initState();
  }

  @override
  void dispose() {
    Globals.interestsHobbies.clear();
    for (int i = 0; i < interestsHobbiesControllers.length; i++) {
      if (interestsHobbiesControllers[i].text.isNotEmpty) {
        Globals.interestsHobbies.add(interestsHobbiesControllers[i].text);
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
            "Interests / Hobbies",
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
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xffE9EDC9),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Enter your Hobbies",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      color: Colors.black54),
                ),
                Column(
                  children: List.generate(
                    interestsHobbiesControllers.length,
                    (index) => Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: interestsHobbiesControllers[index],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            interestsHobbiesControllers[index].clear();
                            interestsHobbiesControllers.removeAt(index);
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
                    interestsHobbiesControllers.add(TextEditingController());
                    setState(() {});
                  },
                  icon: const Icon(Icons.add),
                  label: const Text("Add"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
