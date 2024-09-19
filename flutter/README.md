# infinite

Infinite is an infinitely scalable platform for creating an unlimited number of custom branded mobile apps.

You're absolutely right. Centralizing all build and generation tasks in Fastlane is a great approach. It provides a unified interface for all operations and makes it easier to integrate with CI/CD systems. Let's revise our structure and Fastlane configuration to reflect this:

1. Update the project structure:

```
flutter_project/
├── lib/
│   ├── main.dart
│   ├── app_config.dart
│   └── ...
├── android/
│   └── app/
│       └── build.gradle
├── ios/
│   └── Runner/
│       └── Info.plist
├── solara/
│   ├── apps/
│   │   ├── app1/
│   │   │   ├── config.json
│   │   │   └── assets/
│   │   ├── app2/
│   │   │   ├── config.json
│   │   │   └── assets/
│   │   └── ...
│   ├── core/
│   │   ├── generators/
│   │   ├── utils/
│   │   └── solara_generator.py
│   ├── templates/
│   ├── config/
│   │   ├── solara_config.json
│   │   └── apps_list.json
│   └── requirements.txt
├── fastlane/
│   ├── Fastfile
│   ├── Appfile
│   └── actions/
│       └── solara_actions.rb
├── pubspec.yaml
├── .gitignore
└── README.md
```


# Flutter White Label App with Solara

This project uses Solara to manage and generate white label apps, with Fastlane handling all build and generation tasks.

## Setup

1. Install Flutter and set up your development environment.
2. Install Python dependencies:
   ```
pip install -r solara/requirements.txt
   ```
3. Install Fastlane:
   ```
gem install fastlane
   ```

## Usage

All operations are performed using Fastlane.

To generate artifacts for a specific app:
```
fastlane generate_artifacts app_name:<app_name>
```

To build an app for Android:
```
fastlane android build app_name:<app_name>
```

To build an app for iOS:
```
fastlane ios build app_name:<app_name>
```

To build an app for all platforms:
```
fastlane build_all app_name:<app_name>
```

To build all apps for all platforms:
```
fastlane build_all_apps
```

## Adding a New White Label App

1. Create a new directory in `solara/apps/` with your app name.
2. Add a `config.json` file in this directory with your app's configuration.
3. Add any app-specific assets in an `assets/` subdirectory.
4. Update `solara/apps/apps_list.json` to include your new app.

## Project Structure

- `lib/`: Flutter app source code
- `solara/`: Solara white label management system
  - `apps/`: Individual app configurations and assets
  - `core/`: Solara core logic
  - `templates/`: Templates for generated files
  - `config/`: Solara configuration files
- `fastlane/`: Fastlane configuration for all build and generation tasks
```

This revised structure and configuration centralizes all operations in Fastlane:

1. We've created a custom Fastlane action (`solara_generate`) to run the Solara generator.
2. The `generate_artifacts` lane uses this action to generate app-specific artifacts.
3. The platform-specific `build` lanes first generate artifacts, then proceed with the build.
4. We've added a `build_all` lane to build for both platforms, and a `build_all_apps` lane to build all apps for all platforms.

This approach provides several benefits:
- All operations are unified under Fastlane, providing a consistent interface.
- It's easier to integrate with CI/CD systems that often have built-in support for Fastlane.
- The setup allows for easy extension of build processes, like adding new platforms or build variants.
- It maintains the flexibility of the Solara system while leveraging Fastlane's powerful build and automation capabilities.