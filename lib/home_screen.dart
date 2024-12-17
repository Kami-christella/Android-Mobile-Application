// import 'package:flutter/material.dart';
// import 'calculator.dart';
// import 'sign_in_screen.dart';
// import 'sign_up_screen.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:contacts_service/contacts_service.dart';
// import 'dart:io';
// import 'generated/l10n.dart'; // Import the generated localization file

// class HomeScreen extends StatefulWidget {
//   final Function(ThemeMode) onThemeChanged;
//   final Function(Locale) onLanguageChanged;
//   final List<Contact> contacts;
//   final Function(XFile) onUpdateProfileImage;
//   final XFile? profileImage;

//   const HomeScreen({
//     super.key,
//     required this.onThemeChanged,
//     required this.onLanguageChanged,
//     required this.contacts,
//     required this.onUpdateProfileImage,
//     this.profileImage,
//   });

//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedIndex = 0;
//   bool _isDarkMode = false;
//   late List<Widget> _screens;

//   @override
//   void initState() {
//     super.initState();
//     _screens = [
//       SignInScreen(isDarkMode: _isDarkMode),
//       SignUpScreen(isDarkMode: _isDarkMode),
//       const CalculatorScreen(),
//     ];
//   }

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   Future<void> _getImage(ImageSource source) async {
//     final pickedFile = await ImagePicker().pickImage(source: source);
//     if (pickedFile != null) {
//       widget.onUpdateProfileImage(pickedFile);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(S.of(context).homeScreenTitle),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.language),
//             onPressed: () {
//               _showLanguageDialog(context);
//             },
//           ),
//         ],
//       ),
//       body: _screens[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         items: [
//           BottomNavigationBarItem(
//             icon: const Icon(Icons.login),
//             label: S.of(context).signIn,
//           ),
//           BottomNavigationBarItem(
//             icon: const Icon(Icons.app_registration),
//             label: S.of(context).signUp,
//           ),
//           BottomNavigationBarItem(
//             icon: const Icon(Icons.calculate),
//             label: S.of(context).calculator,
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.amber[800],
//         onTap: _onItemTapped,
//       ),
//       drawer: Drawer(
//         child: Container(
//           color: _isDarkMode ? Colors.grey[800] : Colors.white,
//           child: ListView(
//             padding: EdgeInsets.zero,
//             children: <Widget>[
//               DrawerHeader(
//                 decoration: const BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.topRight,
//                     end: Alignment.bottomLeft,
//                     colors: [Colors.blue, Colors.red],
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     Text(
//                       S.of(context).menu,
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     CircleAvatar(
//                       radius: 40,
//                       backgroundImage: widget.profileImage != null
//                           ? FileImage(File(widget.profileImage!.path))
//                           : const AssetImage('assets/images/default.jpg') as ImageProvider,
//                     ),
//                   ],
//                 ),
//               ),
//               ListTile(
//                 leading: const Icon(Icons.photo_library),
//                 title: Text(S.of(context).selectFromGallery),
//                 onTap: () {
//                   _getImage(ImageSource.gallery);
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.camera_alt),
//                 title: Text(S.of(context).takePicture),
//                 onTap: () {
//                   _getImage(ImageSource.camera);
//                 },
//               ),
//               ListTile(
//                 title: Text(S.of(context).darkMode),
//                 trailing: Switch(
//                   value: _isDarkMode,
//                   onChanged: (value) {
//                     setState(() {
//                       _isDarkMode = value;
//                       _screens[0] = SignInScreen(isDarkMode: _isDarkMode);
//                       _screens[1] = SignUpScreen(isDarkMode: _isDarkMode);
//                       widget.onThemeChanged(value ? ThemeMode.dark : ThemeMode.light);
//                     });
//                   },
//                 ),
//               ),
//               const Divider(),
//               ListTile(
//                 leading: const Icon(Icons.contacts),
//                 title: Text(S.of(context).contacts),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => ContactsScreen(contacts: widget.contacts),
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void _showLanguageDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(S.of(context).chooseLanguage),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ListTile(
//                 title: const Text('English'),
//                 onTap: () {
//                   widget.onLanguageChanged(const Locale('en'));
//                   Navigator.of(context).pop();
//                 },
//               ),
//               ListTile(
//                 title: const Text('Español'),
//                 onTap: () {
//                   widget.onLanguageChanged(const Locale('es'));
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

// class ContactsScreen extends StatelessWidget {
//   final List<Contact> contacts;

//   const ContactsScreen({super.key, required this.contacts});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(S.of(context).contacts),
//       ),
//       body: ListView.builder(
//         itemCount: contacts.length,
//         itemBuilder: (context, index) {
//           final contact = contacts[index];
//           return ListTile(
//             title: Text(contact.displayName ?? 'No Name'),
//             subtitle: Text(contact.phones?.isNotEmpty == true
//                 ? contact.phones!.first.value!
//                 : 'No Phone'),
//           );
//         },
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'calculator.dart';
import 'sign_in_screen.dart';
import 'sign_up_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:contacts_service/contacts_service.dart';
import 'dart:io' show File;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'generated/l10n.dart'; // Import the generated localization file

class HomeScreen extends StatefulWidget {
  final Function(ThemeMode) onThemeChanged;
  final Function(Locale) onLanguageChanged;
  final List<Contact> contacts;
  final Function(XFile) onUpdateProfileImage;
  final XFile? profileImage;

  const HomeScreen({
    super.key,
    required this.onThemeChanged,
    required this.onLanguageChanged,
    required this.contacts,
    required this.onUpdateProfileImage,
    this.profileImage,
  });

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  bool _isDarkMode = false;
  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      SignInScreen(isDarkMode: _isDarkMode),
      SignUpScreen(isDarkMode: _isDarkMode),
      const CalculatorScreen(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      widget.onUpdateProfileImage(pickedFile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).homeScreenTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              _showLanguageDialog(context);
            },
          ),
        ],
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.login),
            label: S.of(context).signIn,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.app_registration),
            label: S.of(context).signUp,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.calculate),
            label: S.of(context).calculator,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      drawer: Drawer(
        child: Container(
          color: _isDarkMode ? Colors.grey[800] : Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.blue, Colors.red],
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      S.of(context).menu,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: widget.profileImage != null
                          ? (kIsWeb
                              ? NetworkImage(widget.profileImage!.path)
                              : FileImage(File(widget.profileImage!.path))) as ImageProvider
                          : const AssetImage('assets/default_profile.png'),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: Text(S.of(context).selectFromGallery),
                onTap: () {
                  _getImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: Text(S.of(context).takePicture),
                onTap: () {
                  _getImage(ImageSource.camera);
                },
              ),
              ListTile(
                title: Text(S.of(context).darkMode),
                trailing: Switch(
                  value: _isDarkMode,
                  onChanged: (value) {
                    setState(() {
                      _isDarkMode = value;
                      _screens[0] = SignInScreen(isDarkMode: _isDarkMode);
                      _screens[1] = SignUpScreen(isDarkMode: _isDarkMode);
                      widget.onThemeChanged(value ? ThemeMode.dark : ThemeMode.light);
                    });
                  },
                ),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.contacts),
                title: Text(S.of(context).contacts),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContactsScreen(contacts: widget.contacts),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).chooseLanguage),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('English'),
                onTap: () {
                  widget.onLanguageChanged(const Locale('en'));
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: const Text('Español'),
                onTap: () {
                  widget.onLanguageChanged(const Locale('es'));
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class ContactsScreen extends StatelessWidget {
  final List<Contact> contacts;

  const ContactsScreen({super.key, required this.contacts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).contacts),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ListTile(
            title: Text(contact.displayName ?? 'No Name'),
            subtitle: Text(contact.phones?.isNotEmpty == true
                ? contact.phones!.first.value!
                : 'No Phone'),
          );
        },
      ),
    );
  }
}
