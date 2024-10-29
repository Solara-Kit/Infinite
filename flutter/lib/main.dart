import 'package:flutter/material.dart';
import 'package:infinite/solara_artifacts/brand_config.dart';
import 'package:infinite/solara_artifacts/brand_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: BrandColorScheme.instance.dark.primary,
      onPrimary: BrandColorScheme.instance.dark.onPrimary,
      primaryContainer: BrandColorScheme.instance.dark.primaryContainer,
      onPrimaryContainer: BrandColorScheme.instance.dark.onPrimaryContainer,
      primaryFixed: BrandColorScheme.instance.dark.primaryFixed,
      primaryFixedDim: BrandColorScheme.instance.dark.primaryFixedDim,
      onPrimaryFixed: BrandColorScheme.instance.dark.onPrimaryFixed,
      onPrimaryFixedVariant:
          BrandColorScheme.instance.dark.onPrimaryFixedVariant,
      secondary: BrandColorScheme.instance.dark.secondary,
      onSecondary: BrandColorScheme.instance.dark.onSecondary,
      secondaryContainer: BrandColorScheme.instance.dark.secondaryContainer,
      onSecondaryContainer: BrandColorScheme.instance.dark.onSecondaryContainer,
      secondaryFixed: BrandColorScheme.instance.dark.secondaryFixed,
      secondaryFixedDim: BrandColorScheme.instance.dark.secondaryFixedDim,
      onSecondaryFixed: BrandColorScheme.instance.dark.onSecondaryFixed,
      onSecondaryFixedVariant:
          BrandColorScheme.instance.dark.onSecondaryFixedVariant,
      tertiary: BrandColorScheme.instance.dark.tertiary,
      onTertiary: BrandColorScheme.instance.dark.onTertiary,
      tertiaryContainer: BrandColorScheme.instance.dark.tertiaryContainer,
      onTertiaryContainer: BrandColorScheme.instance.dark.onTertiaryContainer,
      tertiaryFixed: BrandColorScheme.instance.dark.tertiaryFixed,
      tertiaryFixedDim: BrandColorScheme.instance.dark.tertiaryFixedDim,
      onTertiaryFixed: BrandColorScheme.instance.dark.onTertiaryFixed,
      onTertiaryFixedVariant:
          BrandColorScheme.instance.dark.onTertiaryFixedVariant,
      error: BrandColorScheme.instance.dark.error,
      onError: BrandColorScheme.instance.dark.onError,
      errorContainer: BrandColorScheme.instance.dark.errorContainer,
      onErrorContainer: BrandColorScheme.instance.dark.onErrorContainer,
      surface: BrandColorScheme.instance.dark.surface,
      onSurface: BrandColorScheme.instance.dark.onSurface,
      surfaceDim: BrandColorScheme.instance.dark.surfaceDim,
      surfaceBright: BrandColorScheme.instance.dark.surfaceBright,
      surfaceContainerLowest:
          BrandColorScheme.instance.dark.surfaceContainerLowest,
      surfaceContainerLow: BrandColorScheme.instance.dark.surfaceContainerLow,
      surfaceContainer: BrandColorScheme.instance.dark.surfaceContainer,
      surfaceContainerHigh: BrandColorScheme.instance.dark.surfaceContainerHigh,
      surfaceContainerHighest:
          BrandColorScheme.instance.dark.surfaceContainerHighest,
      onSurfaceVariant: BrandColorScheme.instance.dark.onSurfaceVariant,
      outline: BrandColorScheme.instance.dark.outline,
      outlineVariant: BrandColorScheme.instance.dark.outlineVariant,
      shadow: BrandColorScheme.instance.dark.shadow,
      scrim: BrandColorScheme.instance.dark.scrim,
      inverseSurface: BrandColorScheme.instance.dark.inverseSurface,
      onInverseSurface: BrandColorScheme.instance.dark.onInverseSurface,
      inversePrimary: BrandColorScheme.instance.dark.inversePrimary,
      surfaceTint: BrandColorScheme.instance.dark.surfaceTint,
      background: BrandColorScheme.instance.dark.background,
      onBackground: BrandColorScheme.instance.dark.onBackground,
      surfaceVariant: BrandColorScheme.instance.dark.surfaceVariant,
    );
    return MaterialApp(
      title: 'Infinite',
      theme: ThemeData(
        colorScheme: colorScheme,
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Infinite'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          _headerView(),
          const SizedBox(
            height: 16,
          ),
          _brandInfoView(),
          const Spacer(),
          const Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const Spacer(),
          _footerView(),
        ],
      ),
    );
  }

  Widget _headerView() {
    return Image.asset(
      'assets/solara_artifacts/solara.png',
      width: 200,
      height: 200,
    );
  }

  Widget _brandInfoView() {
    var brandConfig = BrandConfig.instance;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoText(
            'Android Application ID:',
            brandConfig.androidApplicationId,
            BrandColorScheme.instance.dark.primary,
            BrandColorScheme.instance.dark.secondary,
          ),
          _buildInfoText(
            'Android Version Name:',
            brandConfig.androidVersionName,
            BrandColorScheme.instance.dark.primary,
            BrandColorScheme.instance.dark.secondary,
          ),
          _buildInfoText(
            'Android Version Code:',
            brandConfig.androidVersionCode.toString(),
            BrandColorScheme.instance.dark.primary,
            BrandColorScheme.instance.dark.secondary,
          ),
          const SizedBox(height: 16), // Spacing between Android and iOS info
          _buildInfoText(
            'iOS Bundle Identifier:',
            brandConfig.iOSBundleIdentifier,
            BrandColorScheme.instance.dark.primary,
            BrandColorScheme.instance.dark.secondary,
          ),
          _buildInfoText(
            'iOS Marketing Version:',
            brandConfig.iOSMarketingVersion,
            BrandColorScheme.instance.dark.primary,
            BrandColorScheme.instance.dark.secondary,
          ),
          _buildInfoText(
            'iOS Bundle Version:',
            brandConfig.iOSBundleVersion.toString(),
            BrandColorScheme.instance.dark.primary,
            BrandColorScheme.instance.dark.secondary,
          ),
          const SizedBox(height: 16),
          _buildInfoText(
            'showSplashScreen:',
            brandConfig.showSplashScreen.toString(),
            BrandColorScheme.instance.dark.primary,
            BrandColorScheme.instance.dark.secondary,
          ),
          _buildInfoText(
            'baseUrl:',
            brandConfig.baseUrl.toString(),
            BrandColorScheme.instance.dark.primary,
            BrandColorScheme.instance.dark.secondary,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoText(
      String title, String value, Color titleColor, Color valueColor) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              color: titleColor, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(width: 8), // Spacing between title and value
        Expanded(
          child: Text(
            value,
            style: TextStyle(color: valueColor, fontSize: 16),
          ),
        ),
      ],
    );
  }

  Widget _footerView() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children: [
          const Spacer(),
          FloatingActionButton(
            heroTag: "Increment",
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
