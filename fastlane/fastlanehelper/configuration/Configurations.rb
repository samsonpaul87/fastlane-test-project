# /**
#  * @author Samson Paul , samson.paul@experionglobal.com <br>
#  *         Jan 15, 2019, 2:10:34 PM <br>
#  *         Project:- <b>Fastlane-test-project</b>
#  *         <p>
#  *
#  *         Here we add all the file paths to configure
#  *
#  */

# This file is responsible for downloading signing related data from Google Drive
$path_to_shell_script_file = "fastlanehelper/script/download_signing_data.sh"

# This file stores default/dummy signing data
$path_to_default_signing_file = 'fastlanehelper/default/DefaultSigningProperties.txt'

# This file contains actual Signing data
$path_to_actual_signing_file = 'SigningConfigs/signing.properties'

# This file stores version name and version number for the apps
$path_to_version_config_file = '../config/appVersionConfig.properties'

# This file stores "whats new" session
$path_to_change_logs_file = 'metadata/android/en-GB/changelogs'

# This is the path to android metadata directory
$path_to_meta_data_directory = 'metadata/android'

# This is the path to ScreenshotsTest class
$path_to_screenshot_test_class = 'com.experion.fastlanesampleproject.ScreenshotTests'