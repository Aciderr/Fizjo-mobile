import 'package:fizjo/providers/current-user.provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentUserProvider = Provider.of<CurrentUserProvider>(context, listen: true);
    String image = currentUserProvider.selectUser()?.photoURL ?? '';

    return Padding(
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(currentUserProvider.selectUser()?.displayName ?? ''),
            const Padding(
              padding: EdgeInsets.only(top: 4),
              child: Text(
                'Ćwiczysz 7 dzień z rzędu',
                style: TextStyle(fontSize: 12),
              ),
            )
          ],
        ),
        leading: ClipOval(
          child: FadeInImage.assetNetwork(
            placeholder: 'assets/images/loader.gif',
            image: image,
            height: 60,
            width: 60,
            fit: BoxFit.cover,
          ),
        ),
      ),
      padding: const EdgeInsets.only(top: 8),
    );
  }
}