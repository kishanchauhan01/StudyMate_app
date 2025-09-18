# study_mate

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

-   [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
-   [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Folder structure

lib/
├── main.dart
├── widget_tree.dart
|
├── core/ # Code used by multiple features
│ ├── services/ # (e.g., api_service.dart, auth_service.dart)
│ ├── models/ # (e.g., user_model.dart)
│ ├── providers/ # (e.g., theme_provider.dart)
│ └── common_widgets/ # (e.g., custom_button.dart, loading_spinner.dart)
|
└── features/ # Each feature is a self-contained module
├── auth/ # Renamed from 'welcome_pages'
│ ├── screens/
│ │ ├── login_screen.dart
│ │ └── signup_screen.dart
│ ├── widgets/ # Widgets only used in auth screens
│ └── controller/ # State management (e.g., login_controller.dart)
│
├── admin/
│ ├── screens/
│ │ ├── admin_dashboard_screen.dart
│ │ └── manage_users_screen.dart
│ ├── widgets/
│ ├── models/ # Models only used by admin
│ └── controller/
│
└── student/
├── screens/
│ ├── student_profile_screen.dart
│ └── view_grades_screen.dart
├── widgets/
├── models/
└── controller/
