import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../pages/home_page.dart';
import '../pages/tasks_page.dart';
import '../pages/flashcards_page.dart';
import '../pages/pomodoro_page.dart';
import '../pages/profile_page.dart';

class MainLayout {
  static final router = GoRouter(
    initialLocation: '/home',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return NavigationLayout(child: child);
        },
        routes: [
          GoRoute(
            path: '/home',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: HomePage(),
            ),
          ),
          GoRoute(
            path: '/tasks',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: TasksPage(),
            ),
          ),
          GoRoute(
            path: '/flashcards',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: FlashcardsPage(),
            ),
          ),
          GoRoute(
            path: '/pomodoro',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: PomodoroPage(),
            ),
          ),
          GoRoute(
            path: '/profile',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ProfilePage(username: 'Samuele'),
            ),
          ),
        ],
      ),
    ],
  );
}

class NavigationLayout extends StatelessWidget {
  final Widget child;

  const NavigationLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final bool isWideScreen = MediaQuery.of(context).size.width >= 600;

    return Scaffold(
      body: Row(
        children: [
          if (isWideScreen)
            NavigationRail(
              selectedIndex: _getSelectedIndex(context),
              onDestinationSelected: (index) {
                final route = _getRouteFromIndex(index);
                context.go(route);
              },
              labelType: NavigationRailLabelType.all,
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.home,
                      color: Colors.black), // Darker icon color
                  label: Text('Home',
                      style:
                          TextStyle(color: Colors.black)), // Black label color
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.task,
                      color: Colors.black), // Darker icon color
                  label: Text('Tasks',
                      style:
                          TextStyle(color: Colors.black)), // Black label color
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.book_outlined,
                      color: Colors.black), // Darker icon color
                  label: Text('Flashcards',
                      style:
                          TextStyle(color: Colors.black)), // Black label color
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.timer,
                      color: Colors.black), // Darker icon color
                  label: Text('Pomodoro',
                      style:
                          TextStyle(color: Colors.black)), // Black label color
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.person,
                      color: Colors.black), // Darker icon color
                  label: Text('Profile',
                      style:
                          TextStyle(color: Colors.black)), // Black label color
                ),
              ],
            ),
          Expanded(child: child),
        ],
      ),
      bottomNavigationBar: !isWideScreen
          ? BottomNavigationBar(
              currentIndex: _getSelectedIndex(context),
              onTap: (index) {
                final route = _getRouteFromIndex(index);
                context.go(route);
              },
              selectedItemColor:
                  Colors.black, // Colore per l'elemento selezionato
              unselectedItemColor:
                  Colors.black, // Colore per gli elementi non selezionati
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.black),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.task, color: Colors.black),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.book_outlined, color: Colors.black),
                  label: 'Flashcards',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.timer, color: Colors.black),
                  label: 'Pomodoro',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person, color: Colors.black),
                  label: 'Profile',
                ),
              ],
            )
          : null,
    );
  }

  int _getSelectedIndex(BuildContext context) {
    final location = GoRouter.of(context).location;
    switch (location) {
      case '/home':
        return 0;
      case '/tasks':
        return 1;
      case '/flashcards':
        return 2;
      case '/pomodoro':
        return 3;
      case '/profile':
        return 4;
      default:
        return 0;
    }
  }

  String _getRouteFromIndex(int index) {
    switch (index) {
      case 0:
        return '/home';
      case 1:
        return '/tasks';
      case 2:
        return '/flashcards';
      case 3:
        return '/pomodoro';
      case 4:
        return '/profile';
      default:
        return '/home';
    }
  }
}
