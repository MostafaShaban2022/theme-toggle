import 'package:flutter/material.dart';
import 'package:flutter_application_12/providers/provider.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Update the backgroundColor to follow the current theme
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
        child: Consumer<UiProvider>(
          builder: (context, UiProvider notifier, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    // Wrapping the ListTile with an Expanded widget
                    const Expanded(
                      child: ListTile(
                        leading: Icon(
                          Icons.dark_mode,
                        ),
                        title: Text('Dark theme'),
                      ),
                    ),
                    Switch(
                      value: notifier.isDark,
                      activeColor: Colors.red,
                      onChanged: (value) => notifier.changeTheme(),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
