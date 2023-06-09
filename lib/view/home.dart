import 'package:flutter/material.dart';
import 'package:flutter_app_testing/cubit/user_cubit.dart';
import 'package:flutter_app_testing/view/detail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   List<UserModel> users = [];
//   bool isLoading = false;
//   @override
//   void initState() {
    
//     context.read<UserCubit>().getAllUser();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<UserCubit, UserState>(
//       listener: (context, state) {
//         if (state is UserLoading) {
//           setState(() {
//             isLoading = true;
//           });
//         } else if (state is UserSuccess) {
//           setState(() {
//             users = state.users;
//             isLoading = false;
//           });
//         }
//       },
//       builder: (context, state) {
//         return Scaffold(
//           floatingActionButton: FloatingActionButton(
//             onPressed: () {
//               Navigator.pushNamed(context, '/add');
//             },
//             child: const Icon(Icons.add),
//           ),
//           appBar: AppBar(
//             title: const Text(
//               'Flutter CRUD',
//             ),
//           ),
//           body: (isLoading == true)
//               ? const Center(
//                   child: CircularProgressIndicator(),
//                 )
//               : ListView.builder(
//                   itemCount: users.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Container(
//                       padding: const EdgeInsets.all(10),
//                       child: ListTile(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (_) => DetailPage(
//                                 userModel: users[index],
//                               ),
//                             ),
//                           );
//                         },
//                         title: Text(users[index].name!),
//                         subtitle: Text(users[index].job!),
//                       ),
//                     );
//                   },
//                 ),
//         );
//       },
//     );
//   }
// }

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<UserCubit>().getAllUser();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text(
          'Flutter CRUD',
        ),
      ),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserSuccess) {
            if (state.users.isEmpty) {
              return const Center(
                child: Text(
                  'No Data',
                ),
              );
            } else {
              return ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DetailPage(
                              userModel: state.users[index],
                            ),
                          ),
                        );
                      },
                      title: Text(state.users[index].name!),
                      subtitle: Text(state.users[index].job!),
                    ),
                  );
                },
              );
            }
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
