# Flutter Riverpod

Riverpod is a modern, safe, and flexible state management library for Flutter.  
It eliminates common issues found in traditional approaches by providing compile-time safety, a reactive architecture, and first-class support for async state handling.

This content helps you understand:
- How to structure providers  
- How to read and watch providers in widgets  
- How to use advanced Riverpod features (e.g., `autoDispose`, `family`, `listen`)  
- How to test, debug, and scale your app architecture  

---

## 🚀 Getting Started

1. **Add dependencies** to your `pubspec.yaml`:

   ```yaml
   dependencies:
     flutter:
       sdk: flutter
     flutter_riverpod: ^2.3.6

2. **Wrap your app** with `ProviderScope` in `main.dart`:

   ```dart
   void main() {
     runApp(
       ProviderScope(
         child: MyApp(),
       ),
     );
   }
   ```

   The `ProviderScope` widget stores the state of all providers.

3. **Import Riverpod** in your files:

   ```dart
   import 'package:flutter_riverpod/flutter_riverpod.dart';
   ```

---

## 🧠 Core Concepts

### Providers

A **provider** encapsulates state or logic that can be accessed throughout the app.

```dart
final greetingProvider = Provider<String>((ref) {
  return 'Hello, Riverpod!';
});
```

### Reading Providers

#### Using `ConsumerWidget`

```dart
class GreetingText extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = ref.watch(greetingProvider);
    return Text(text);
  }
}
```

#### Using `Consumer`

```dart
Consumer(
  builder: (context, ref, child) {
    final text = ref.watch(greetingProvider);
    return Text(text);
  },
)
```

#### Stateful Widgets

For lifecycle-based logic, use `ConsumerStatefulWidget` and `ConsumerState` to access `ref` safely.

---

## 🔍 Watching, Reading, and Listening

| Method                           | Purpose                                                  |
| -------------------------------- | -------------------------------------------------------- |
| `ref.watch(provider)`            | Rebuilds widget when the provider changes                |
| `ref.read(provider)`             | Reads value once (no rebuilds)                           |
| `ref.listen(provider, callback)` | Triggers side effects when provider changes (no rebuild) |

Example:

```dart
ref.listen(counterProvider, (previous, next) {
  if (next == 10) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Reached 10!')),
    );
  }
});
```

---

## ⚙️ Types of Providers

| Provider                             | Use Case                                                  |
| ------------------------------------ | --------------------------------------------------------- |
| `Provider<T>`                        | Read-only, constant values or services                    |
| `StateProvider<T>`                   | Simple mutable state (e.g., counters, toggles)            |
| `StateNotifierProvider<Notifier, T>` | Complex logic with immutable state                        |
| `FutureProvider<T>`                  | Asynchronous computations (network calls, etc.)           |
| `StreamProvider<T>`                  | Continuous data streams                                   |
| `NotifierProvider<Notifier, T>`      | Recommended for advanced logic (replaces `StateNotifier`) |
| `AsyncNotifierProvider<Notifier, T>` | Asynchronous version of `NotifierProvider`                |
| `ChangeNotifierProvider`             | Bridge for legacy `ChangeNotifier` classes                |

---

## 🧩 Provider Modifiers

* **`autoDispose`** → Automatically disposes provider when not in use

  ```dart
  final userProvider = FutureProvider.autoDispose((ref) async {
    return fetchUser();
  });
  ```

* **`family`** → Parameterized providers

  ```dart
  final userProvider = FutureProvider.family<User, int>((ref, id) async {
    return fetchUserById(id);
  });
  ```

* **`select`** → Watch a subset of state to reduce rebuilds

  ```dart
  ref.watch(userProvider.select((user) => user.name));
  ```

* **`keepAlive()`** → Prevents disposal for cached results

  ```dart
  final dataProvider = FutureProvider.autoDispose((ref) async {
    final link = ref.keepAlive();
    return loadData();
  });
  ```

---

## 🧪 Testing

Riverpod makes testing easy by isolating providers within a `ProviderContainer`.

```dart
testWidgets('Counter increments', (tester) async {
  await tester.pumpWidget(ProviderScope(child: MyApp()));
  
  expect(find.text('0'), findsOneWidget);
  await tester.tap(find.byType(ElevatedButton));
  await tester.pump();
  
  expect(find.text('1'), findsOneWidget);
});
```

You can also override providers during tests:

```dart
ProviderScope(
  overrides: [
    apiClientProvider.overrideWithValue(MockApiClient()),
  ],
  child: MyApp(),
);
```

---

## 🪵 Logging and Debugging

You can observe provider updates with a custom `ProviderObserver`.

```dart
class AppLogger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    print('[${provider.name ?? provider.runtimeType}] → $newValue');
  }
}

void main() {
  runApp(
    ProviderScope(
      observers: [AppLogger()],
      child: MyApp(),
    ),
  );
}
```

---

## 🏗 Recommended Architecture

A scalable Flutter + Riverpod project can be divided into layers:

```
lib/
│
├── data/          # Repositories, APIs, data sources
├── domain/        # Entities and business logic
├── application/   # Providers and state management
└── presentation/  # UI widgets and screens
```

This separation keeps logic organized, testable, and easy to extend.

---

## 📄 License

This project is open-sourced under the MIT License.

---

