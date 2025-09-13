// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'dart:async';


// Entry point of the app
void main() {
  runApp(const MyApp());
}


// Main App Widget

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Introducing with the widgets',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
        useMaterial3: true,
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          bodyMedium: TextStyle(fontSize: 16.0, color: Colors.black87),
        ),
        appBarTheme: const AppBarTheme(foregroundColor: Colors.black),
        cardTheme: const CardThemeData(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        ),
      ),
      home: const SplashScreen(), // <-- Show splash first
    );
  }
}


// --- SplashScreen Widget ---
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    )..forward();
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    // Navigate to Home after 2 seconds
    Timer(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const MyHomePage(title: 'Learn')),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ScaleTransition(
                scale: _animation,
                child: const FlutterLogo(size: 100),
              ),
              const SizedBox(height: 24),
              Text(
                "Practice App",
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}



// Home Page with all UI features and navigation
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _switchValue = true;
  bool _checkboxValue = true;
  String _textFieldValue = '';

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text('Success!')),

            Icon(Icons.check_circle_rounded, color: Colors.white),
          ],
        ),
        duration: const Duration(milliseconds: 900),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        margin: const EdgeInsets.fromLTRB(570, 0, 570, 0),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
        textAlign: TextAlign.center,
      ),
    );
  }

  List<Widget> _buildSections(BuildContext context) {
    return [
      const Center(child: AnimatedLogo()),
      const SizedBox(height: 30),
      Text(
        'Explore various Flutter UI elements designed for a clean and modern user experience.',
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 18),
        textAlign: TextAlign.center,
      ),
      const SizedBox(height: 30),
      _buildSectionTitle('Text Styles & Typography'),
      Card(
        child: Padding(
          padding: const EdgeInsets.all(60.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Welcome To The Basic Text Example',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 13),
              Text(
                'Stylized Text: Bold & Italic',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.primary,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 17),
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.tertiaryContainer,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  'Distinct Background',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onTertiaryContainer,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 30),
      // Icons
      _buildSectionTitle('Icons Showcase'),
      Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const <Widget>[
              Icon(Icons.picture_as_pdf_rounded, size: 45, color: Colors.red),
              Icon(Icons.facebook_rounded, size: 45, color: Colors.blue),
              Icon(
                Icons.bookmark_outline_rounded,
                size: 40,
                color: Colors.blueGrey,
              ),
              Icon(Icons.check_circle_rounded, size: 45, color: Colors.blue),
            ],
          ),
        ),
      ),
      const SizedBox(height: 30),
      // Buttons
      _buildSectionTitle('Interactive Buttons'),
      Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _showSnackbar('Primary Action Clicked!'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    'Perform Action',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => _showSnackbar('Add Item Clicked!'),
                  icon: const Icon(Icons.add_circle_outline, size: 23),
                  label: const Text(
                    'Add New Item',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => _showSnackbar('Learn More Tapped!'),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    'Learn More',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                child: TextButton.icon(
                  onPressed: () => _showSnackbar('Settings Opened!'),
                  icon: const Icon(Icons.settings_outlined, size: 23),
                  label: const Text(
                    'App Settings',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 30),
      // Advanced UI Elements
      _buildSectionTitle('Advanced UI Elements'),
      Card(
        child: Container(
          height: 120,
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple.shade100, Colors.deepPurple.shade50],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 8),
                blurRadius: 15,
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Text(
            'Visually and graphically enhanced Container',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.deepPurple,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      const SizedBox(height: 10),
      // Switches & Checkboxes
      Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ListTile(
                title: const Text('Enable Notifications:'),
                trailing: Switch(
                  value: _switchValue,
                  onChanged: (bool newValue) {
                    setState(() {
                      _switchValue = newValue;
                      _showSnackbar('Notifications: $_switchValue');
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              ListTile(
                title: const Text('Agree to Terms & Conditions:'),
                trailing: Checkbox(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(20),
                  ),
                  value: _checkboxValue,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _checkboxValue = newValue ?? false;
                      _showSnackbar('Terms Accepted: $_checkboxValue');
                    });
                  },
                  activeColor: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 10),
      // TextField
      Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'User Input Field',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 10),
              TextField(
                onChanged: (text) {
                  setState(() {
                    _textFieldValue = text;
                  });
                },
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  labelText: 'Your Full Name',
                  hintText: 'Enter your full name',
                  prefixIcon: const Icon(Icons.person_outline),
                  suffixIcon: _textFieldValue.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            setState(() {
                              _textFieldValue = '';
                            });
                          },
                        )
                      : null,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  'Currently entered: ${_textFieldValue.isEmpty ? 'Nothing' : _textFieldValue}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 30),
      // Navigation Buttons
      _buildSectionTitle('Navigate to Other Pages'),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton.icon(
            icon: const Icon(Icons.account_circle),
            label: const Text('Profile'),
            onPressed: () {
              Navigator.of(context).push(_smoothRoute(const ProfilePage()));
            },
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.photo_library),
            label: const Text('Gallery'),
            onPressed: () {
              Navigator.of(context).push(_smoothRoute(const GalleryPage()));
            },
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.info_outline),
            label: const Text('About'),
            onPressed: () {
              Navigator.of(context).push(_smoothRoute(const AboutPage()));
            },
          ),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final sections = _buildSections(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          tooltip: 'Try this widget',
          onPressed: () => _showSnackbar('Success'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            tooltip: 'Profile',
            onPressed: () {
              Navigator.of(context).push(_smoothRoute(const ProfilePage()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.photo_library),
            tooltip: 'Gallery',
            onPressed: () {
              Navigator.of(context).push(_smoothRoute(const GalleryPage()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'About',
            onPressed: () {
              Navigator.of(context).push(_smoothRoute(const AboutPage()));
            },
          ),
        ],
      ),
      body: AnimationLimiter(
        child: ListView.builder(
          padding: const EdgeInsets.all(20.0),
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          cacheExtent: 1200,
          itemCount: sections.length,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              delay: Duration(milliseconds: 40 * index),
              duration: const Duration(milliseconds: 320),
              child: SlideAnimation(
                verticalOffset: 24.0,
                curve: Curves.easeOutCubic,
                child: FadeInAnimation(
                  curve: Curves.easeIn,
                  child: sections[index],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: AnimatedScale(
        scale: 1.0,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOutBack,
        child: AnimatedOpacity(
          opacity: 1.0,
          duration: const Duration(milliseconds: 400),
          child: FloatingActionButton(
            onPressed: () => _showSnackbar('Floating Action Button Pressed!'),
            tooltip: 'Add New',
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            elevation: 8,
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}



// Helper for smooth page transitions
Route _smoothRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final tween = Tween(
        begin: 0.96,
        end: 1.0,
      ).chain(CurveTween(curve: Curves.easeOutCubic));
      return FadeTransition(
        opacity: animation,
        child: ScaleTransition(scale: animation.drive(tween), child: child),
      );
    },
    transitionDuration: const Duration(milliseconds: 420),
  );
}

// Animated Logo Widget
class AnimatedLogo extends StatefulWidget {
  const AnimatedLogo({super.key});
  @override
  State<AnimatedLogo> createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(
      begin: 0.8,
      end: 1.2,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: const FlutterLogo(size: 80),
    );
  }
}



// Profile Page
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile'), centerTitle: true),
      body: Center(
        child: Card(
          elevation: 8,
          margin: const EdgeInsets.all(24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  radius: 40,
                  child: Icon(Icons.person, size: 37),
                  backgroundColor: Colors.blue,
                ),
                const SizedBox(height: 16),
                Text(
                  'Your Name',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  'Description',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(
                      context,
                    ).push(_smoothRoute(const SettingsPage()));
                  },
                  icon: const Icon(Icons.settings),
                  label: const Text('Go to Settings'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




// Settings Page with Animated Switches
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _darkMode = false;
  bool _notifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          ListTile(
            leading: const Icon(Icons.dark_mode),
            title: const Text('Dark Mode'),
            trailing: AnimatedSwitcher(
              duration: const Duration(milliseconds: 100),
              transitionBuilder: (child, animation) =>
                  ScaleTransition(scale: animation, child: child),
              child: Switch(
                key: ValueKey(_darkMode),
                value: _darkMode,
                onChanged: (val) {
                  setState(() => _darkMode = val);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Dark Mode: ${_darkMode ? "ON" : "OFF"}'),
                      duration: const Duration(milliseconds: 800),
                    ),
                  );
                },
                activeColor: Colors.blue,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.notifications_active),
            title: const Text('Notifications'),
            trailing: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) =>
                  ScaleTransition(scale: animation, child: child),
              child: Switch(
                key: ValueKey(_notifications),
                value: _notifications,
                onChanged: (val) {
                  setState(() => _notifications = val);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Notifications: ${_notifications ? "ON" : "OFF"}',
                      ),
                      duration: const Duration(milliseconds: 800),
                    ),
                  );
                },
                activeColor: Colors.green,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back),
              label: const Text('Back'),
            ),
          ),
        ],
      ),
    );
  }
}



// Gallery Page with Animated Grid
class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});
  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  final List<Color> _colors = [
    Colors.pink.shade500,
    Colors.blue.shade500,
    Colors.green.shade500,
    Colors.orange.shade500,
    Colors.purple.shade500,
    Colors.teal.shade500,
    Colors.amber.shade500,
    Colors.red.shade500,
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    )..forward();
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gallery'), centerTitle: true),
      body: FadeTransition(
        opacity: _animation,
        child: GridView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: _colors.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
          ),
          itemBuilder: (context, index) {
            return ScaleTransition(
              scale: _animation,
              child: Container(
                decoration: BoxDecoration(
                  color: _colors[index],
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: const Center(
                  child: Icon(Icons.image, color: Colors.white, size: 48),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}




// About Page
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About'), centerTitle: true),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(32),
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.info_outline,
                  size: 60,
                  color: Colors.blueAccent,
                ),
                const SizedBox(height: 16),
                Text(
                  """
                  This app demonstrates smooth navigation, animations and modern Flutter UI widgets.
                Stay updated, Stay cool❤️.

                  """,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Text(
                  'This App is created using Flutter Framework.',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



// //  Start...
// // Gallery Page with Animated Grid
class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});
  @override
  State<GalleryPage> createState() => _GalleryPageState();
}


class _GalleryPageState extends State<GalleryPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  final List<Color> _colors = [
    Colors.pink.shade500,
    Colors.blue.shade500,
    Colors.green.shade500,
    Colors.orange.shade500,
    Colors.purple.shade500,
    Colors.teal.shade500,
    Colors.amber.shade500,
    Colors.red.shade500,
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    )..forward();
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gallery'), centerTitle: true),
      body: FadeTransition(
        opacity: _animation,
        child: GridView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: _colors.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
          ),
          itemBuilder: (context, index) {
            return ScaleTransition(
              scale: _animation,
              child: Container(
                decoration: BoxDecoration(
                  color: _colors[index],
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: const Center(
                  child: Icon(Icons.image, color: Colors.white, size: 48),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}




// About Page
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About'), centerTitle: true),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(32),
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.info_outline,
                  size: 60,
                  color: Colors.blueAccent,
                ),
                const SizedBox(height: 16),
                Text(
                  """
                  This app demonstrates smooth navigation, animations and modern Flutter UI widgets.
                Stay updated, Stay cool❤️.

                  """,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Text(
                  'This App is created using Flutter Framework.',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
