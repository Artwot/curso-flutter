import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../common_widgets/show_alert_dialog.dart';
import '../../services/auth.dart';
import '../../services/database.dart';
import '../models/job.dart';
import 'edit_job_page.dart';
import 'empty_content.dart';
import 'job_list_tile.dart';
import 'list_items_builder.dart';

class JobsPage extends StatelessWidget {
  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await showAlertDialog(
      context,
      title: 'Logout',
      content: 'Are your sure that you want to logout?',
      cancelActionText: 'Cancel',
      defaultActionText: 'Logout',
    );

    if (didRequestSignOut == true) _signOut(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jobs'),
        actions: <Widget>[
          TextButton(
            child: Text(
              'Logout',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            onPressed: () => _confirmSignOut(context),
          )
        ],
      ),
      body: _buildContents(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => EditJobPage.show(context),
      ),
    );
  }

  Widget _buildContents(BuildContext context) {
    final database = Provider.of<Database>(context, listen: false);
    return StreamBuilder<List<Job?>>(
      stream: database.jobsStream(),
      builder: (context, snapshot) {
        return ListItemsBuilder<Job>(
          snapshot: snapshot,
          itemBuilder: (context, job) => JobListTile(
            job: job,
            onTap: () => EditJobPage.show(context, job: job),
          ),
        );
      },
    );
  }
}
