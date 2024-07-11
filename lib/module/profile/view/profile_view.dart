import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/constants/app_colors.dart';
import 'package:shop/constants/app_string.dart';
import 'package:shop/widgets/app_bold_text.dart';
import 'package:shop/widgets/app_text.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var query = MediaQuery.of(context);
    final appBar = AppBar(title: const AppText(AppString.profile));

    return Scaffold(
      appBar: appBar,
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Column(
                children: [
                  Container(
                    height: query.size.height * .25,
                    width: double.infinity,
                    color: AppColor.textColor,
                  ),
                ],
              ),
              Positioned(
                height: query.size.height * .49,
                left: (query.size.width / 2.0 - 59).floorToDouble(),
                child: const CircleAvatar(
                  radius: 60.0,
                  backgroundColor: Color(0xFFF8F8F9),
                  child: Icon(CupertinoIcons.person, size: 60.0),
                ),
              )
            ],
          ),
          const SizedBox(height: 70.0),
          const Column(
            children: [
              AppBoldText('Pawan Kumar', fontSize: 25.0),
              AppText('pk89844@gmail.com',
                  fontSize: 13.0, color: Colors.black54),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 8.0, bottom: 12.0),
                  child: const AppBoldText('General', color: Colors.black45),
                ),
                const ProfileListTile(
                    leadingIcons: CupertinoIcons.cube, tittle: 'My Order'),
                const Divider(),
                const ProfileListTile(
                    leadingIcons: CupertinoIcons.person,
                    tittle: 'Personal Data'),
                const Divider(),
                const ProfileListTile(
                    leadingIcons: CupertinoIcons.music_house,
                    tittle: 'Address Book'),
                const Divider(),
                const ProfileListTile(
                    leadingIcons: Icons.wallet, tittle: 'Payment Method'),
                const Divider(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProfileListTile extends StatelessWidget {
  final String tittle;
  final IconData leadingIcons;
  final void Function()? onTap;
  const ProfileListTile(
      {super.key,
      required this.tittle,
      required this.leadingIcons,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundColor: const Color(0xFFF8F8F9),
        child: Icon(leadingIcons),
      ),
      title: AppText(tittle, color: Colors.black38, fontSize: 16.0),
      trailing: const SizedBox(
        width: 40.0,
        child: Icon(CupertinoIcons.forward, color: Colors.black38),
      ),
    );
  }
}
