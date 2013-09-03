# encoding: utf-8

require "dotum"
require "dotum/externs/json"

class Dotum::Rules::Sublime3Package < Dotum::AbstractRules::OptionsBase

  shorthand :package_name

  required :package_name

  def pretty_subject
    @package_name
  end

protected

  def execute
    if settings_file.exists?
      content = JSON.parse(@settings_file.read)
    else
      content = {"installed_packages" => []}
    end

    content["installed_packages"].push(@package_name)
    content["installed_packages"].uniq!

    settings_file.write(JSON.generate(content, SUBLIME_JSON_GENERATION_OPTIONS))
  end

  def settings_file
    @settings_file ||= sublime3_data_dir.join(
      "Packages", "User", "Package Control.sublime-settings"
    )
  end

end
