import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Add
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.FloatingActionButton
import androidx.compose.material3.Icon
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.material3.TopAppBar
import androidx.compose.material3.TopAppBarDefaults
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableIntStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.navigation.NavController
import com.android.infinite.R


@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun HomeScreen(navController: NavController, title: String) {
    var counter by remember { mutableIntStateOf(0) }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text(text = title) },
            )
        },
        content = { paddingValues ->
            Column(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(paddingValues),
                verticalArrangement = Arrangement.SpaceBetween,
                horizontalAlignment = Alignment.CenterHorizontally // Add this line
            ) {
                HeaderView()
                Spacer(modifier = Modifier.height(16.dp))
                BrandInfoView()
                Spacer(modifier = Modifier.weight(1f))
                Column(
                    horizontalAlignment = Alignment.CenterHorizontally
                ) {
                    Text("You have pushed the button this many times:")
                    Text(
                        text = "$counter",
                        style = MaterialTheme.typography.headlineMedium
                    )
                }
                Spacer(modifier = Modifier.weight(1f))
                FooterView(
                    onIncrementClick = { counter++ }
                )
            }
        }
    )
}

@Composable
fun HeaderView() {
    Image(
        painter = painterResource(id = R.drawable.solara),
        contentDescription = "Solara Logo",
        modifier = Modifier
            .size(200.dp)
            .fillMaxWidth()
    )
}

@Composable
fun BrandInfoView() {
    val brandConfig = BrandConfig.instance

    Column(
        modifier = Modifier.padding(16.dp)
    ) {
        InfoText("Application ID:", brandConfig.applicationId)
        InfoText("Version Name:", brandConfig.versionName)
        InfoText("Version Code:", brandConfig.versionCode.toString())
        InfoText("baseUrl:", brandConfig.baseUrl)
        InfoText("showSplashScreen:", brandConfig.showSplashScreen.toString())
        Spacer(modifier = Modifier.height(16.dp))
    }
}

@Composable
fun InfoText(title: String, value: String) {
    Row(
        modifier = Modifier.fillMaxWidth(),
        verticalAlignment = Alignment.Top
    ) {
        Text(
            text = title,
            fontWeight = FontWeight.Bold,
            fontSize = 18.sp
        )
        Spacer(modifier = Modifier.width(8.dp))
        Text(
            text = value,
            fontSize = 16.sp,
            modifier = Modifier.weight(1f)
        )
    }
}

@Composable
fun FooterView(onIncrementClick: () -> Unit) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .padding(24.dp),
        horizontalArrangement = Arrangement.End
    ) {
        FloatingActionButton(
            onClick = onIncrementClick,
            content = { Icon(Icons.Default.Add, contentDescription = "Increment") }
        )
    }
}