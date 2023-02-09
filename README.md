# Demo Gallery

## About

This app use Very_good_create to create the code base. Here is the core feature we use:
- Navigation: Auto_route
- State Management: Bloc
- Internationalizing: l10n
- Networking: Dio, Retrofit
- Json: json_serializable
- CLI to generate structure: Mason

## Structure
Generated folder architecture
```
📦lib
 ┣ 📂core
 ┃ ┣ 📂routes
 ┃ ┣ 📂dependency
 ┣ 📂data
 ┃ ┣ 📂datasource
 ┃ ┃ ┣ 📂local
 ┃ ┃ ┗ 📂api
 ┃ ┣ 📂model
 ┃ ┗ 📂repo
 ┗ 📂presentation
 ┃ ┣ 📂pages
 ┃ ┗ 📂widgets
 ```

## How to run

flutter pub get

flutter pub run build_runner build --delete-conflicting-outputs