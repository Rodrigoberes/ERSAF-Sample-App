# ERSAF SAMPLE APP

## Getting Started

A simple Flutter app per la gestione degli utenti, con operazioni CRUD (Create, Read, Update, Delete). I dati degli utenti sono salvati localmente in un file JSON

### Run the code

```bash
# Run in iOS-Android Emulator
flutter run
```

### Lint and test the code

Before submit a Merge Request you need to make sure that the following commands are executed and completes:

```bash
# Make sure to use the Dart code formatter to have a unified style
dart fix --apply

# Make sure that there are no analyzer errors
flutter analyze

# Check the tests pass
flutter test
```

## Code generation

### Generate freezed/JSON/mock classes

To (re-)generate the Dart classes the following command could be used:

```shell
flutter pub run build_runner build --delete-conflicting-outputs
```