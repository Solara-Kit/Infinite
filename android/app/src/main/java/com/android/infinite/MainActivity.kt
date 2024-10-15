package com.android.infinite

import BrandConfig
import HomeScreen
import android.os.Bundle
import android.view.Menu
import android.view.MenuItem
import androidx.activity.compose.setContent
import androidx.appcompat.app.AppCompatActivity
import androidx.compose.material3.MaterialTheme
import androidx.compose.runtime.Composable
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.stringResource
import androidx.navigation.compose.rememberNavController
import androidx.navigation.findNavController
import androidx.navigation.ui.AppBarConfiguration
import androidx.navigation.ui.navigateUp

class MainActivity : AppCompatActivity() {

    private lateinit var appBarConfiguration: AppBarConfiguration

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        setContent {
            InfiniteApp()
        }
    }

    override fun onCreateOptionsMenu(menu: Menu): Boolean {
        // Inflate the menu; this adds items to the action bar if it is present.
        menuInflater.inflate(R.menu.menu_main, menu)
        return true
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        return when (item.itemId) {
            R.id.action_settings -> true
            else -> super.onOptionsItemSelected(item)
        }
    }

    override fun onSupportNavigateUp(): Boolean {
        val navController = findNavController(R.id.nav_host_fragment_content_main)
        return navController.navigateUp(appBarConfiguration)
                || super.onSupportNavigateUp()
    }
}

@Composable
fun InfiniteApp() {
    val navController = rememberNavController()

    MaterialTheme(
        colorScheme = MaterialTheme.colorScheme.copy(
            primary = Color(BrandColorScheme.instance.dark.primary),
            onPrimary = Color(BrandColorScheme.instance.dark.onPrimary),
            primaryContainer = Color(BrandColorScheme.instance.dark.primaryContainer),
            onPrimaryContainer = Color(BrandColorScheme.instance.dark.onPrimaryContainer),
            inversePrimary = Color(BrandColorScheme.instance.dark.inversePrimary),
            secondary = Color(BrandColorScheme.instance.dark.secondary),
            onSecondary = Color(BrandColorScheme.instance.dark.onSecondary),
            secondaryContainer = Color(BrandColorScheme.instance.dark.secondaryContainer),
            onSecondaryContainer = Color(BrandColorScheme.instance.dark.onSecondaryContainer),
            tertiary = Color(BrandColorScheme.instance.dark.tertiary),
            onTertiary = Color(BrandColorScheme.instance.dark.onTertiary),
            tertiaryContainer = Color(BrandColorScheme.instance.dark.tertiaryContainer),
            onTertiaryContainer = Color(BrandColorScheme.instance.dark.onTertiaryContainer),
            background = Color(BrandColorScheme.instance.dark.background),
            onBackground = Color(BrandColorScheme.instance.dark.onBackground),
            surface = Color(BrandColorScheme.instance.dark.surface),
            onSurface = Color(BrandColorScheme.instance.dark.onSurface),
            surfaceVariant = Color(BrandColorScheme.instance.dark.surfaceVariant),
            onSurfaceVariant = Color(BrandColorScheme.instance.dark.onSurfaceVariant),
            surfaceTint = Color(BrandColorScheme.instance.dark.surfaceTint),
            inverseSurface = Color(BrandColorScheme.instance.dark.inverseSurface),
            inverseOnSurface = Color(BrandColorScheme.instance.dark.inverseOnSurface),
            error = Color(BrandColorScheme.instance.dark.error),
            onError = Color(BrandColorScheme.instance.dark.onError),
            errorContainer = Color(BrandColorScheme.instance.dark.errorContainer),
            onErrorContainer = Color(BrandColorScheme.instance.dark.onErrorContainer),
            outline = Color(BrandColorScheme.instance.dark.outline),
            outlineVariant = Color(BrandColorScheme.instance.dark.outlineVariant),
            scrim = Color(BrandColorScheme.instance.dark.scrim),
            surfaceBright = Color(BrandColorScheme.instance.dark.surfaceBright),
            surfaceDim = Color(BrandColorScheme.instance.dark.surfaceDim),
            surfaceContainer = Color(BrandColorScheme.instance.dark.surfaceContainer),
            surfaceContainerHigh = Color(BrandColorScheme.instance.dark.surfaceContainerHigh),
            surfaceContainerHighest = Color(BrandColorScheme.instance.dark.surfaceContainerHighest),
            surfaceContainerLow = Color(BrandColorScheme.instance.dark.surfaceContainerLow),
            surfaceContainerLowest = Color(BrandColorScheme.instance.dark.surfaceContainerLowest),
        )
    ) {
        val isActive = remember { mutableStateOf(true) }

        if (BrandConfig.instance.showSplashScreen && isActive.value) {
            SplashScreen(isActive)
        } else {
            HomeScreen(navController = navController, title = stringResource(R.string.app_name))
        }
    }
}

