# Cinema Plus

Cinema Plus is a Flutter-based movie booking app with features including ticket booking, favorites management, cinema listings, and business-defined theming.

## Features

- Movie ticket booking
- Favorites management
- Cinema listings
- Business-defined theming
- Environment-specific configurations

## Getting Started

### Prerequisites

- Flutter SDK (version 3.5.0 or higher)
- Dart SDK (version X.X.X or higher)
- Android Studio / VS Code with Flutter extensions

### Installation

1. Clone the repository:
   ```
   git clone https://github.com/Utitofon-Udoekong/cinema-plus.git
   ```

2. Navigate to the project directory:
   ```
   cd cinema-plus
   ```

3. Install dependencies:
   ```
   flutter pub get
   ```

4. Set up environment variables:
   - open the`env` folder
   - Fill in the required values in `prod.env`, `dev.env` and `stg.env` based on the environment used

5. Run the app:
   ```
   flutter run
   ```

## Project Structure

```
[env]
    ├── dev.json
    ├── prod.json
    └── stg.json
[ios]
    ├── [Flutter]
        ├── flutter_export_environment.sh
    ├── [Runner]
        ├── [Assets.xcassets]
            ├── [AppIcon.appiconset]
            └── [LaunchImage.imageset]
[lib]
    └── [src]
        ├── [components]
            ├── [booking]
            ├── [cinema]
            ├── [loader]
            ├── [movies]
            ├── [payment]
            ├── [ticket]
        ├── [constants]
        ├── [core]
            └── [router]
        ├── [domain]
            └── [repository]
        ├── [features]
            ├── [authentication]
                ├── [cubit]
            ├── [booking]
                ├── [cinema]
                └── [cubit]
            ├── [home]
                ├── [favorites]
                    ├── [cubit]
                ├── [movies]
                    ├── [cubit]
                ├── [profile]
                    ├── [cubit]
                └── [tickets]
                    ├── [cubit]
            ├── [movie_details]
                └── [details]
            ├── [movie_tabs]
                └── [tabs]
            ├── [payment]
                ├── [cubit]
            └── [search]
                └── [cubit]
        ├── [models]
            ├── [movie]
                ├── [actor]
                ├── [cast]
        ├── [service]
            ├── [dio]
        └── [style]
            ├── [color]
            ├── [text]
            └── [theme]
[packages]
    ├── [cache]
    └── [form_inputs]
[pubspec.yaml]
```

## Configuration

The app uses environment-specific configurations. To modify these:

1. Open `env/{ENVIRONMENT}.dart`
2. Update the values as needed

## Theming

To customize the app's theme:

1. Navigate to `lib/style`
2. Modify any of the custom classes to adjust colors, fonts, etc.

## Contributing

1. Fork the repository
2. Create your feature branch: `git checkout -b feature/AmazingFeature`
3. Commit your changes: `git commit -m 'Add some AmazingFeature'`
4. Push to the branch: `git push origin feature/AmazingFeature`
5. Open a pull request

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.