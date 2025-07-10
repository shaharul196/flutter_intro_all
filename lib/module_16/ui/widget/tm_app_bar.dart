import 'package:flutter/material.dart';
import 'package:ostad_flutter_sazu/app.dart';
import 'package:ostad_flutter_sazu/module_16/ui/screens/sign_in_screen.dart';

import '../screens/update_profile_screen.dart';

class TMAppBar extends StatefulWidget implements PreferredSizeWidget {
  const TMAppBar({
    super.key,
  });

  @override
  State<TMAppBar> createState() => _TMAppBarState();

  @override
  // kToolbar hocce Standard size
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _TMAppBarState extends State<TMAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      title: GestureDetector(
        onTap: _onTapProfileBar,
        child: Row(
          children: [
            CircleAvatar(),
            SizedBox(width: 16,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Sazu Islam',style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),),
                  Text('sazu5@gmail.com',style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),),
                ],
              ),
            ),
            IconButton(onPressed: _onTapLogOutButton, icon: Icon(Icons.logout)),

          ],
        ),
      ),
    );
  }

  void _onTapLogOutButton(){
    Navigator.pushNamedAndRemoveUntil(context, SignInScreen.name, (predicate) => false);
  }

  void _onTapProfileBar(){
    if(ModalRoute.of(context)!.settings.name != UpdateProfileScreen.name){
      Navigator.pushNamed(context, UpdateProfileScreen.name);
    }
  }


}


