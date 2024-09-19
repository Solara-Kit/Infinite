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
            primary = Color(BrandTheme.Colors.primary),
            onPrimary = Color(BrandTheme.Colors.onPrimary),
            secondary = Color(BrandTheme.Colors.secondary),
            onSecondary = Color(BrandTheme.Colors.onSecondary),
            surface = Color(BrandTheme.Colors.surface),
            onSurface = Color(BrandTheme.Colors.onSurface),
            background = Color(BrandTheme.Colors.background),
            error = Color(BrandTheme.Colors.error),
            onBackground = Color(BrandTheme.Colors.onBackground),
            onError = Color(BrandTheme.Colors.onError),
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

