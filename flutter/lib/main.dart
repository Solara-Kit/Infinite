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
    return MaterialApp(
      title: 'Infinite',
      theme: ThemeData(
        colorScheme: const ColorScheme(
          primary: BrandColors.primary,
          secondary: BrandColors.secondary,
          surface: BrandColors.surface,
          background: BrandColors.background,
          error: BrandColors.error,
          onPrimary: BrandColors.onPrimary,
          onSecondary: BrandColors.onSecondary,
          onSurface: BrandColors.onSurface,
          onBackground: BrandColors.onBackground,
          onError: BrandColors.onError,
          brightness: Brightness.light,
        ),
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
          const SizedBox(height: 16,),
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
    const brandConfig = BrandConfig.instance;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoText(
            'Android Application ID:',
            brandConfig.androidApplicationId,
            BrandColors.primary,
            BrandColors.secondary,
          ),
          _buildInfoText(
            'Android Version Name:',
            brandConfig.androidVersionName,
            BrandColors.primary,
            BrandColors.secondary,
          ),
          _buildInfoText(
            'Android Version Code:',
            brandConfig.androidVersionCode.toString(),
            BrandColors.primary,
            BrandColors.secondary,
          ),
          const SizedBox(height: 16), // Spacing between Android and iOS info
          _buildInfoText(
            'iOS Bundle Identifier:',
            brandConfig.iOSBundleIdentifier,
            BrandColors.primary,
            BrandColors.secondary,
          ),
          _buildInfoText(
            'iOS Marketing Version:',
            brandConfig.iOSMarketingVersion,
            BrandColors.primary,
            BrandColors.secondary,
          ),
          _buildInfoText(
            'iOS Bundle Version:',
            brandConfig.iOSBundleVersion.toString(),
            BrandColors.primary,
            BrandColors.secondary,
          ),
          const SizedBox(height: 16),
          _buildInfoText(
            'showSplashScreen:',
            brandConfig.showSplashScreen.toString(),
            BrandColors.primary,
            BrandColors.secondary,
          ),
          _buildInfoText(
            'baseUrl:',
            brandConfig.baseUrl.toString(),
            BrandColors.primary,
            BrandColors.secondary,
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
          style: TextStyle(color: titleColor, fontWeight: FontWeight.bold, fontSize: 18),
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
