import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../common_widgets/show_alert_dialog.dart';
import '../../../common_widgets/show_exception_alert_dialog.dart';
import '../../services/database.dart';
import '../models/job.dart';

class EditJobPage extends StatefulWidget {
  const EditJobPage({
    Key? key,
    required this.database,
    required this.job,
  }) : super(key: key);
  final Database database;
  final Job? job;

  // Mostrar el widget a través de una navegación
  static Future<void> show(BuildContext context, {Job? job}) async {
    final database = Provider.of<Database>(context, listen: false);
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EditJobPage(database: database, job: job),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  State<EditJobPage> createState() => _EditJobPageState();
}

class _EditJobPageState extends State<EditJobPage> {
  final _formKey = GlobalKey<FormState>();

  String? _name;
  int? _ratePerHour;

  bool _validateAndSaveForm() {
    final form = _formKey.currentState;
    if (form?.validate() == true) {
      form?.save();
      return true;
    }
    return false;
  }

  Future<void> _submit() async {
    try {
      // Obtiene el primer valor en el Stream
      final jobs = await widget.database.jobsStream().first;
      // Obtener los nombres de jobs
      final allNames = jobs.map((job) => job?.name).toList();
      // Verificar que no existe un job con el mismo nombre
      if (allNames.contains(_name)) {
        showAlertDialog(
          context,
          title: 'Name already used',
          content: 'Please choose a different job name',
          defaultActionText: 'Ok',
        );
      } else {
        final job = Job(name: _name!, ratePerHour: _ratePerHour!);
        await widget.database.createJob(job);
        Navigator.of(context).pop();
      }
    } on FirebaseException catch (e) {
      showExceptionAlertDialog(
        context,
        title: 'Operation failed',
        exception: e,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        title: Text('New Job'),
        actions: [
          TextButton(
            onPressed: _submit,
            child: Text(
              'Save',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: _buildContents(),
      backgroundColor: Colors.grey[200],
    );
  }

  _buildContents() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          // Placeholder crea un widget que dibuja una caja
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildForm(),
          ),
        ),
      ),
    );
  }

  _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _buildFromChildren(),
      ),
    );
  }

  _buildFromChildren() {
    return [
      TextFormField(
        decoration: InputDecoration(labelText: 'Job name'),
        validator: (value) =>
            (value?.isNotEmpty)! ? null : 'Name can\'t be empty',
        // Se recomienda usar la propiedad onSaved para actualizar variables locales
        onSaved: (value) => _name = value!,
      ),
      TextFormField(
        decoration: InputDecoration(labelText: 'Rate per hour'),
        keyboardType: TextInputType.numberWithOptions(
          signed: false,
          decimal: false,
        ),
        onSaved: (value) => _ratePerHour = int.parse(value!),
      ),
    ];
  }
}
