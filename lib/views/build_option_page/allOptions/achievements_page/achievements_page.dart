import 'package:flutter/material.dart';
import 'package:resume_builder_app/utils/extentions.dart';
import 'package:resume_builder_app/utils/globals.dart';

class AchievementsPage extends StatefulWidget {
  const AchievementsPage({super.key});

  @override
  State<AchievementsPage> createState() => _AchievementsPageState();
}

class _AchievementsPageState extends State<AchievementsPage> {
  List<TextEditingController> achievementsControllers = [];

  @override
  void initState() {
    if (Globals.achievements.isEmpty) {
      achievementsControllers = List.generate(
        2,
        (i) => TextEditingController(),
      );
    } else if (Globals.achievements.length < 2) {
      Globals.achievements.forEach((e) {
        achievementsControllers.add(
          TextEditingController(text: e),
        );
      });
      achievementsControllers.add(TextEditingController());
    } else {
      Globals.achievements.forEach((e) {
        achievementsControllers.add(
          TextEditingController(text: e),
        );
      });
    }

    super.initState();
  }

  @override
  void dispose() {
    Globals.achievements.clear();
    for (int i = 0; i < achievementsControllers.length; i++) {
      if (achievementsControllers[i].text.isNotEmpty) {
        Globals.achievements.add(achievementsControllers[i].text);
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
            "Technical Skills Page",
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
                  "Enter Your Achievements",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      color: Colors.black54),
                ),
                Column(
                  children: List.generate(
                    achievementsControllers.length,
                    (index) => Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            controller: achievementsControllers[index],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            achievementsControllers[index].clear();
                            achievementsControllers.removeAt(index);
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
                    achievementsControllers.add(TextEditingController());
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
