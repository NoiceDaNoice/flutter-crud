import 'package:flutter/material.dart';
import 'package:flutter_app_testing/cubit/user_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPage extends StatelessWidget {
  AddPage({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController jobController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    const snackBar = SnackBar(
      content: Text('Add Success!!'),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Page',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                label: Text(
                  'Name',
                ),
              ),
            ),
            TextFormField(
              controller: jobController,
              decoration: const InputDecoration(
                label: Text(
                  'Job',
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                context.read<UserCubit>().addUser(
                    name: nameController.text, job: jobController.text);
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                // Navigator.pushNamedAndRemoveUntil(
                //     context, '/', (route) => false);
                Navigator.pop(context);
              },
              child: const Text(
                'Submit',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
