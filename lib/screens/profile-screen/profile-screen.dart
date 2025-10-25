import 'package:demo_noti/data/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Text(
                    'Profile', // Title for the profile screen
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                        width: 4,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        'assets/images/avatar.jpg',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Robert Albert', // User's name
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'robertalbert123@gmail.com', // User's email
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  SizedBox(height: 24),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildProfileOption(
                          context,
                          icon: Icons.person,
                          title: 'Edit Profile',
                          onTap: () {
                            // Navigate to account settings
                          },
                        ),
                        SizedBox(height: 20), // Add spacing between options
                        _buildProfileOption(
                          context,
                          icon: Icons.notifications,
                          title: 'Notifications',
                          onTap: () {
                            // Navigate to notifications settings
                          },
                        ),
                        SizedBox(height: 20), // Add spacing between options
                        _buildProfileOption(
                          context,
                          icon: Icons.lock,
                          title: 'Privacy',
                          onTap: () {
                            // Navigate to privacy settings
                          },
                        ),
                        SizedBox(height: 20), // Add spacing between options
                        _buildProfileOption(
                          context,
                          icon: Icons.help,
                          title: 'Help & Support',
                          onTap: () {
                            // Navigate to help & support
                          },
                        ),
                        SizedBox(height: 20),
                        _buildProfileOption(
                          context,
                          icon: Icons.settings,
                          title: 'Sattings',
                          onTap: () {
                            // Navigate to help & support
                            context.push('/profile/settings');
                          },
                        ),
                        SizedBox(height: 20),
                        _buildProfileOption(
                          context,
                          icon: Icons.logout,
                          title: 'Log out',
                          onTap: () {
                            // Navigate to help & support
                            Provider.of<AuthService>(context, listen: false).logout();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileOption(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
        title: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
