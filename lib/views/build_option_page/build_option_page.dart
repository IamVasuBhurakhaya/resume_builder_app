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
        title: Text("Build Option Page"),
      ),
      body: Column(
        children: AppRoutes.allOption
            .map(
              (e) => ListTile(
                leading: Image.asset(
                  e['icon'],
                  height: 25,
                ),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(e['route']);
                  },
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
