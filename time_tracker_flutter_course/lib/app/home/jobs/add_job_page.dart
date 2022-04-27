import 'package:flutter/material.dart';

class AddJobPage extends StatefulWidget {
  // Mostrar el widget a través de una navegación
  static Future<void> show(BuildContext context) async {
    await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => AddJobPage(),
      fullscreenDialog: true,
    ));
  }

  @override
  State<AddJobPage> createState() => _AddJobPageState();
}

class _AddJobPageState extends State<AddJobPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        title: Text('New Job'),
      ),
    );
  }
}
