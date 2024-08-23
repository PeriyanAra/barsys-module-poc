pluginManagement {
    repositories {
        google {
            content {
                includeGroupByRegex("com\\.android.*")
                includeGroupByRegex("com\\.google.*")
                includeGroupByRegex("androidx.*")
            }
        }
        mavenCentral()
        gradlePluginPortal()
    }
}
dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.PREFER_SETTINGS)
    repositories {
        google()
        mavenCentral()
        val storageUrl =
            System.getenv("FLUTTER_STORAGE_BASE_URL") ?: "https://storage.googleapis.com"

        repositories {
            maven {
                url =
                    uri("/Users/araperiyanf4/Projects/barsys_module_poc/barsys_flutter_module_poc/build/host/outputs/repo")
            }
            maven {
                url = uri("$storageUrl/download.flutter.io")
            }
        }
    }
}

rootProject.name = "barsys_poc_android"
include(":app")
