# /**
#  * @author Samson Paul , samson.paul@experionglobal.com <br>
#  *         Jan 15, 2019, 4:50:21 PM <br>
#  *         Project:- <b>Android</b>
#  *         <p>
#  *
#  *         Here we add all the file related tasks for fastlane
#  *
#  */

$text_playstore_version_code = 'playstoreVersionCode'
$text_file_extension = '.txt'

# following method is used for auto increment version code

def update_new_version_code_to_file(new_version_code)
  path = Dir.glob($path_to_version_config_file).first
  updated_version_config = ''
  file = File.open(path)

  File.foreach(file).with_index do |line, _line_num|
    line.gsub!(/[\r\n]+$/, '')

    if line.start_with?($text_playstore_version_code)
      updated_version_config = $text_playstore_version_code + "=#{new_version_code}\n"
    else
      updated_version_config += line
    end

    # Here we write new version code and version number to migymVersionConfig.properties file
    File.write(path, updated_version_config)
  end
end


# following method is used to write what's New session to changelogs

def create_whats_new_file(version_code, whats_new)
  version_code = version_code.to_s

  FileUtils.rm_rf(Dir[$path_to_change_logs_file])

  path = $path_to_change_logs_file + '/' + version_code + $text_file_extension

  FileUtils.mkdir_p(File.dirname(path)) unless File.exist?(File.dirname(path))

  if whats_new != ''
    File.open(path, 'w') do |f|
      whats_new.each do |line|
        line = '• ' + line
        f.write(line)
        f.write "\n"
      end
    end
  end
end


# Deleting metadata directory after processing
def file_task_delete_metadata()
  FileUtils.rm_rf(Dir[$path_to_meta_data_directory +'/*'])
end
