# gll_app

Orgnization management application

## Getting Started
(1) Clone the repository
```bash
git clone https://github.com/Phinexa-dev/gll-app.git
```
(2) Open the project in android studio
(3) Run the project using main.dart on an emulator or a physical device


## Architecture
- feature first architecture
- each feature is a separate module
- each feature has its own presentation, model, repositories, providers, notifiers, and services
- presentation layer has its own widgets, screens, and UI logic
- common shared widgets, and UI logic are in the core module including the theme, localization, and routing
- firebase services are in the cloud functions module
