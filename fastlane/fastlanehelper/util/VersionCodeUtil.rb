# /**
#  * @author Samson Paul , samson.paul@experionglobal.com <br>
#  *         Jan 15, 2019, 5:34:44 PM <br>
#  *         Project:- <b>Android</b>
#  *         <p>
#  *
#  *         Here we add all the Version code related tasks for fastlane
#  *
#  */


# Arraylist of currently available Playstore tracks. Update it when new tracks available
$playstore_deploy_tracks = ['alpha', 'beta', 'production', 'rollout', 'internal']

# Following method is used to retrieve greatest version code of the application in Playstore.
# We will increment the resultant version code by one, so that we can use the new version code to deploy new applications

def increment_playstore_version_code_by_one(package_name)

  new_version_code = 0

  # Iterate over the strings with "each."
  $playstore_deploy_tracks.each do |playstore_track|

    latest_version_code = google_play_track_version_codes(package_name: package_name, track: playstore_track)

    if !latest_version_code.empty? && !latest_version_code.nil?
      latest_version_code = latest_version_code[0]
      if latest_version_code > new_version_code
        new_version_code = latest_version_code.to_i
      end
    end
  end
  new_version_code += 1
end


# Following method is used to retrieve current version code of the application in specified track of Playstore.

def retrieve_current_versioncode_from_playstore(package_name, required_track)
  new_version_code = 0
  current_version_code = google_play_track_version_codes(package_name: package_name, track: required_track)
  if !current_version_code.empty? && !current_version_code.nil?
    new_version_code = current_version_code[0].to_i
  end
  new_version_code
end