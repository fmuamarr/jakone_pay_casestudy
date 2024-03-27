import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:jakone_pay_case_study/widgets/sub_header_with_title.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _logout(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    final featuresList = [
      {'name': 'Account Balance', 'icon': Icons.money, 'trailing': false},
      {'name': 'Cards', 'icon': Icons.credit_card, 'trailing': false},
      {'name': 'Help center', 'icon': Icons.help, 'trailing': false},
      {'name': 'Terms & Conditions', 'icon': Icons.description},
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: GFListTile(
                  avatar: GFAvatar(
                    child: Image.network('https://i.pravatar.cc/300'),
                  ),
                  titleText: 'User',
                  subTitleText: 'Complete your Account profile',
                  icon: const Icon(Icons.arrow_forward_ios_rounded,
                      color: Colors.grey),
                  margin: const EdgeInsets.all(5.0),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  color: Colors.white,
                  onTap: () {},
                ),
              ),
              const SizedBox(height: 10),
              _buildSubHeader(context, 'Support'),
              _buildFeaturesList(featuresList),
              _buildSubHeader(context, 'Others'),
              _buildLogoutTile(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SubHeaderNoIcon(title: title, press: () {}, buttonText: ""),
    );
  }

  Widget _buildFeaturesList(List<Map<String, dynamic>> featuresList) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => const Divider(color: Colors.grey),
      itemCount: featuresList.length,
      itemBuilder: (context, index) {
        final feature = featuresList[index];
        return GFListTile(
          avatar: Icon(feature['icon'] as IconData),
          titleText: feature['name'].toString(),
          onTap: () {},
          icon: const Icon(Icons.arrow_forward_ios_outlined, size: 16),
        );
      },
    );
  }

  Widget _buildLogoutTile(BuildContext context) {
    return GFListTile(
      avatar: const Icon(Icons.logout_outlined),
      titleText: 'Logout',
      icon: const Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey),
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      color: Colors.white,
      onTap: () {
        _logout(context);
      },
    );
  }
}
