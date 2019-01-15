# /**
#  * @author Samson Paul , samson.paul@experionglobal.com <br>
#  *         Dec 15, 2019, 2:40:24 PM <br>
#  *         Project:- <b>Fastlane-test-project</b>
#  *         <p>
#  *
#  *         Here we add all the Signing helper methods for fastlane
#  *
#  */

$cmd_to_remove_signing_directory = "rm -rf SigningConfigs/*"
$cmd_to_create_new_signing_file = "echo >> SigningConfigs/signing.properties"


# Following method will run the download script, which we have written inside download_ci_data file
def download_actual_signing_credentials()
  sh($path_to_shell_script_file)
end

# Following method will delete actual credentials and update default signing credentials in signing.properties file (inside SigningConfigs folder)
def restore_default_signing_credentials()
  system($cmd_to_remove_signing_directory)
  system($cmd_to_create_new_signing_file)
  IO.copy_stream($path_to_default_signing_file, $path_to_actual_signing_file)
end

