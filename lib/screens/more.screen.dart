import 'package:fizjo/widgets/user_header.widget.dart';
import 'package:flutter/material.dart';
import 'package:fizjo/providers/current-user.provider.dart';
import 'package:provider/provider.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var currentUserProvider = Provider.of<CurrentUserProvider>(context, listen: false);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // const UserHeader(),
        const ListTile(
          title: Text('Dostosowanie ćwiczeń'),
          leading: Icon(Icons.add),
        ),
        ListTile(
          onTap: () async {
            // await currentUserProvider.signInWithGoogle();
          },
          title: const Text('Zaloguj'),
          leading: const Icon(Icons.add),
        )
      ],
    );
  }
}

