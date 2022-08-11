[![badge_flutter]][link_flutter_release]
[![style: lint](https://img.shields.io/badge/style-lint-4BC0F5.svg)](https://pub.dev/packages/lint)

# certificate_maker
**Goal**: A Flutter project to generate IKMF certificates.

## Requirements
* Computer (Windows, Mac or Linux)
* Android Studio

## Setup the project in Android studio
1. Download the project code, preferably using `git clone git@github.com:YannMancel/certificate_maker.git`.
2. In Android Studio, select *File* | *Open...*
3. Select the project

## Dependencies
* Flutter Version Management
    * [fvm][dependencies_fvm]
* Linter
    * [lint][dependencies_lint]
* Generators (assets, launcher icon, splash screens & dependency graph)
    * [flutter_gen][dependencies_flutter_gen]
    * [flutter_launcher_icons][dependencies_flutter_launcher_icons]
    * [flutter_native_splash][dependencies_flutter_native_splash]
    * [lakos][dependencies_lakos]
* Data class generator
    * [build_runner][dependencies_build_runner]
    * [freezed][dependencies_freezed]
    * [freezed_annotation][dependencies_freezed_annotation]
* State managers
    * [flutter_hooks][dependencies_flutter_hooks]
    * [hooks_riverpod][dependencies_hooks_riverpod]
* Directory path
    * [dependencies_path_provider]
* Pdf & Printing
    * [printing][dependencies_printing]

## Troubleshooting

### No device available during the compilation and execution steps
* If none of device is present (*Available Virtual Devices* or *Connected Devices*),
    * Either select `Create a new virtual device`
    * or connect and select your phone or tablet

## Useful
* [Download Android Studio][useful_android_studio]
* [Create a new virtual device][useful_virtual_device]
* [Enable developer options and debugging][useful_developer_options]

[badge_flutter]: https://img.shields.io/badge/flutter-v3.0.5-blue?logo=flutter
[link_flutter_release]: https://docs.flutter.dev/development/tools/sdk/releases
[link_apple_doc]: https://developer.apple.com/documentation/bundleresources/information_property_list/nsapptransportsecurity
[dependencies_fvm]: https://fvm.app/
[dependencies_lint]: https://pub.dev/packages/lint
[dependencies_flutter_gen]: https://pub.dev/packages/flutter_gen
[dependencies_flutter_launcher_icons]: https://pub.dev/packages/flutter_launcher_icons
[dependencies_flutter_native_splash]: https://pub.dev/packages/flutter_native_splash
[dependencies_lakos]: https://pub.dev/packages/lakos
[dependencies_build_runner]: https://pub.dev/packages/build_runner
[dependencies_freezed]: https://pub.dev/packages/freezed
[dependencies_freezed_annotation]: https://pub.dev/packages/freezed_annotation
[dependencies_flutter_hooks]: https://pub.dev/packages/flutter_hooks
[dependencies_hooks_riverpod]: https://pub.dev/packages/hooks_riverpod
[dependencies_path_provider]: https://pub.dev/packages/path_provider
[dependencies_printing]: https://pub.dev/packages/printing
[useful_android_studio]: https://developer.android.com/studio
[useful_virtual_device]: https://developer.android.com/studio/run/managing-avds.html
[useful_developer_options]: https://developer.android.com/studio/debug/dev-options.html#enable

