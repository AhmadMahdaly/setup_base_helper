# توثيق كامل للمشروع `setup_base_helper`

## 1. وصف عام للمشروع والغرض منه
هذا المشروع هو **قالب إعداد (Starter/Setup Template) لتطبيقات Flutter** يحتوي على بنية أساسية (core) تشمل: DI, caching, networking (Dio), theme, shared widgets, routing، وملف `my_app` كنقطة بداية. الهدف من المشروع هو أن يكون **قالبًا لإطلاق أي مشروع Flutter** بحيث يمكن إعداد الإعدادات العامة بسرعة ثم البدء ببناء المزايا الخاصة.

**ملاحظات حول الاستخدام:** هذا القالب مناسب كـ `starter` لبدء مشروع: ستقوم أولًا بضبط `analysis_options`, إضافة التبعيات الخاصة بك، تعديل Bundle ID والـ build.gradle، ثم تعبئة مجلد core بالـ services والـ widgets المشتركة، ثم إعداد `main.dart` و `MyApp`، تنفيذ `dart fix --apply`، إضافة الخطوط، إنشاء common widgets، ثم رفع المشروع إلى GitHub بفرعين `main` و `dev`.

## 2. شجرة الملفات مرتبة (مجلدات رئيسية وملفات مهمة)

```
- `Helper-master/`
  - `analysis_options.yaml`
  - `pubspec.yaml`
```

### ملاحظة: قائمة الملفات
- `Helper-master/analysis_options.yaml`
- `Helper-master/lib/core/bloc_observer.dart`
- `Helper-master/lib/core/cache_helper/cache_helper.dart`
- `Helper-master/lib/core/cache_helper/cache_values.dart`
- `Helper-master/lib/core/constants.dart`
- `Helper-master/lib/core/di.dart`
- `Helper-master/lib/core/functions/debug_print_extension.dart`
- `Helper-master/lib/core/functions/flutter_toast.dart`
- `Helper-master/lib/core/init/initializer.dart`
- `Helper-master/lib/core/networking/dio_factory.dart`
- `Helper-master/lib/core/networking/dio_interceptors.dart`
- `Helper-master/lib/core/networking/end_points.dart`
- `Helper-master/lib/core/networking/failures.dart`
- `Helper-master/lib/core/responsive/responsive_config.dart`
- `Helper-master/lib/core/routing/app_routes.dart`
- `Helper-master/lib/core/routing/router_generation_config.dart`
- `Helper-master/lib/core/services/launch_url.dart`
- `Helper-master/lib/core/services/make_callphone.dart`
- `Helper-master/lib/core/services/setup_fmc.dart`
- `Helper-master/lib/core/shared_widgets/custom_dropdown_button.dart`
- `Helper-master/lib/core/shared_widgets/custom_primary_button.dart`
- `Helper-master/lib/core/shared_widgets/custom_primary_textfield.dart`
- `Helper-master/lib/core/theme/app_colors.dart`
- `Helper-master/lib/core/theme/app_text_style.dart`
- `Helper-master/lib/core/theme/app_themes.dart`
- `Helper-master/lib/features/my_app/my_app.dart`
- `Helper-master/lib/main.dart`
- `Helper-master/pubspec.yaml`

## 3. وصف لكل مجلد رئيسي وملف مهم
### `lib/`
- يحتوي الشفرة المصدرية للتطبيق.
- ملف الدخول المتوقع: `Helper-master/lib/main.dart`. مقتطف من بدايته:
```dart
import 'package:flutter/material.dart';

import '/../core/init/initializer.dart';
import '/../features/my_app/my_app.dart';

void main() async {
  await initializeApp();
  runApp(const MyApp());
}

```

### `lib/core/`
- هذه المجلدات عادةً تحتوي:
  - `di.dart`: تسجيل الخدمات في DI container.
  - `networking/`: إعداد Dio، Interceptors، Endpoints، Failures.
  - `cache_helper/`: تخزين واسترجاع القيم (SharedPreferences wrapper).
  - `routing/`: تعريف المسارات وRouter generation config.
  - `theme/`: app_colors, app_text_style, app_themes.
  - `shared_widgets/`: أزرار وحقول نصوص قابلة لإعادة الاستخدام.

## 4. مصفوفة التبعيات (Dependencies)

### Dependencies

- **flutter**: `{'sdk': 'flutter'}`
- **cupertino_icons**: `^1.0.8`
- **flutter_secure_storage**: `^9.2.4`
- **shared_preferences**: `^2.5.3`
- **fluttertoast**: `^8.2.12`
- **dio**: `^5.9.0`
- **go_router**: `^16.2.0`
- **url_launcher**: `^6.3.2`
- **flutter_bloc**: `^9.1.1`
- **get_it**: `^8.2.0`

### Dev Dependencies

- **flutter_test**: `{'sdk': 'flutter'}`
- **flutter_lints**: `^5.0.0`
- **pretty_dio_logger**: `^1.4.0`
- **very_good_analysis**: `^9.0.0`

_لا توجد خطوط معرفة في pubspec.yaml_


## 5. نقاط ضعف أو أخطاء محتملة في تنظيم الكود ومقترحات عملية للتحسين
### نقاط محتملة للتحسين:
- **إضافة اختبارات**: لا يظهر وجود مجلد `test/` في الشجرة. إنشاء اختبارات وحدة وويدجت أساسية مهم جدا.
- **تنظيف الاعتمادات**: راجع `pubspec.yaml` واحذف الحزم غير المستخدمة لتقليل الحجم.
- **التوثيق الداخلي**: إضافة تعليقات ودوال موثقة لكل ملف مركزي وخاصة network & repository.

## 6. Steps


### المتطلبات
- Flutter SDK (>= 3.x)
- Dart
- Android Studio / Xcode (لتشغيل على المحاكي/الأجهزة)

### الإعداد المحلي
```bash
flutter pub get
dart fix --apply
flutter run
```

### تعديل الإعدادات الأساسية قبل البدء
1. تعديل `bundleId`/`applicationId` في ملفات `android` و`ios`.
2. تعديل `analysis_options.yaml` بإضافة قواعد lint المطلوبة.
3. إضافة الخطوط في `pubspec.yaml` تحت قسم `flutter/fonts`.
4. تحديث الـ dependencies حسب احتياجات المشروع.
5. إنشاء `common widgets` داخل `lib/core/shared_widgets/`.

### أوامر مساعدة
- `flutter clean`
- `flutter pub get`
- `flutter pub run build_runner build --delete-conflicting-outputs`
- `dart fix --apply`


## 7. قائمة TODO عامة مرتبة بالأولوية
### عالية
- تعديل `bundleId` وملفات build (Android & iOS).
- إعداد repository على GitHub وإنشاء فرعي `main` و`dev`.
- تنفيذ `dart fix --apply` للتصحيح التلقائي لمشاكل الـ lints البسيطة.
### متوسطة
- إضافة الخطوط وتحديث `pubspec.yaml`.
- إنشاء common widgets (buttons, textfields, dialogs).
- إضافة طبقة Repository وفصل data layer.
### منخفضة
- إعداد GitHub Actions لـ CI/CD.
- إضافة وثائق إضافية ومخططات UML إذا رغبت.

## 8. تسلسل الخطوات مع أوامر وملاحظات مفصلة
المخطط الذي ذكرتَه مفصّل وسنترجمه إلى خطوات عملية قابلة للتنفيذ:

1. **set up analysis_options.yaml**
- افتح `analysis_options.yaml` وضبط القواعد (lints) التي تريدها. مثال: `package:lint/recommended` أو إعداد قواعد خاصة بالمشروع.

2. **أضف التبعيات التي ستستخدمها**
- افتح `pubspec.yaml` وأضف الحزم المطلوبة تحت `dependencies` و`dev_dependencies`. مثال: `dio`, `get_it`, `flutter_bloc`, `equatable`, `shared_preferences`, `logger`، إلخ.

3. **تعديل Bundle ID وBuild Gradle**
- Android: `android/app/build.gradle`، ضبط `applicationId`، وتحديث `signingConfigs` إذا لزم.
- iOS: تعديل `Runner` bundle identifier في Xcode أو `ios/Runner/Info.plist`.

4. **أضف ال core بمشتملاته**
- راجع مجلد `lib/core/` واقتران الملفات: `di.dart`, `cache_helper`, `networking`, `routing`, `theme`, `shared_widgets`, `services`.

5. **إعداد `main.dart` و `MyApp`**
- تهيئة DI في `main()` قبل `runApp()`، ضبط BlocObserver، وربط MaterialApp/GoRouter/Theme داخل `MyApp`.

6. **تشغيل `dart fix --apply`**
- نفّذ الأمر لتطبيق الإصلاحات التلقائية: `dart fix --apply`.

7. **إضافة الخطوط (Fonts)**
- أضف ملفات الخطوط إلى `assets/fonts/` وعرّفها في `pubspec.yaml` تحت `flutter/fonts`.

8. **إنشاء common widgets**
- أنشئ Buttons, TextFields, Dialogs, Loading, Error widgets داخل `lib/core/shared_widgets/`.

9. **تهيئة GitHub Repo وإدارة الفروع**
- أنشئ repo جديد محليًا ثم ارفع إلى GitHub:
```bash
git init
git add .
git commit -m "initial: starter project"
git branch -M main
git remote add origin <your-github-repo-url>
git push -u origin main
git checkout -b dev
git push -u origin dev
```

## 9. أوامر لتشغيل المشروع محليًا (مختصر)
```bash
flutter pub get
dart fix --apply
flutter run --flavor development -t lib/main.dart
```

## 10. Checklist مفصل قبل رفع المشروع
### إعداد المشروع (قائمة 1)
- [ ] تحديث `applicationId` / `bundleId` لكل من Android و iOS
- [ ] ضبط `minSdkVersion` و `targetSdkVersion` إن لزم
- [ ] إضافة الخطوط وتحديث `pubspec.yaml`
- [ ] تنفيذ `dart fix --apply` و `flutter format`
- [ ] تشغيل `flutter analyze` والتأكد من خلو التحذيرات الحرجة

### رفع للمستودع (قائمة 2)
- [ ] إنشاء مستودع GitHub
- [ ] إضافة `.gitignore` مناسب (Flutter)
- [ ] عمل فرعين `main` و `dev`
- [ ] إجراء أول push

### جودة الكود/CI (قائمة 3)
- [ ] إعداد GitHub Actions لتشغيل `flutter analyze` و `flutter test`
- [ ] إعداد code coverage إن أردت

### optional
- [ ] تفعيل Firebase (Analytics / Crashlytics) إن رغبت
- [ ] إعداد FCM وPermissions
