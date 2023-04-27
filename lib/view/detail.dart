import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/user_cubit.dart';
import '../model/user_model.dart';

class DetailPage extends StatelessWidget {
  final UserModel userModel;
  const DetailPage({
    super.key,
    required this.userModel,
  });
  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController =
        TextEditingController(text: userModel.name);
    final TextEditingController jobController =
        TextEditingController(text: userModel.job);
    const snackBar = SnackBar(
      content: Text('Update Success!!'),
    );
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Hapus User?'),
                actions: [
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.labelLarge,
                    ),
                    child: const Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.labelLarge,
                    ),
                    child: const Text('Delete'),
                    onPressed: () {
                      context.read<UserCubit>().delete(id: userModel.id!);
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.delete),
      ),
      appBar: AppBar(
        title: const Text(
          'Update/Delete Page',
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
                context.read<UserCubit>().updateUser(
                    name: nameController.text,
                    job: jobController.text,
                    id: userModel.id!);
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                Navigator.pop(context);
              },
              child: const Text(
                'Update',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
