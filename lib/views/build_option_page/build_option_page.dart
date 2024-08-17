import 'package:flutter/material.dart';
import 'package:resume_builder_app/routes/app_routes.dart';

class BuildOptionPage extends StatefulWidget {
  const BuildOptionPage({super.key});

  @override
  State<BuildOptionPage> createState() => _BuildOptionPageState();
}

class _BuildOptionPageState extends State<BuildOptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Build Option Page",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: Colors.black87,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: AppRoutes.allOption
              .map(
                (e) => Container(
                  margin: EdgeInsets.only(right: 15, left: 15, bottom: 15),
                  decoration: BoxDecoration(
                    color: Color(0xffE9EDC9),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: ListTile(
                    leading: Image.asset(
                      e['icon'],
                      height: 35,
                      color: Colors.black54,
                    ),
                    title: Text(
                      e['title'],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(e['route']);
                      },
                      icon: const Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
