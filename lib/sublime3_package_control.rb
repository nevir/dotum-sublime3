# encoding: utf-8

require "dotum"

class Dotum::Rules::Sublime3PackageControl < Dotum::AbstractRules::OptionsBase

  def pretty_subject
    ""
  end

protected

  def execute
    download "https://sublime.wbond.net/Package Control.sublime-package" =>
      sublime3_data_dir.join("Installed Packages", "Package Control.sublime-package")

    sublime3_package "Package Control"
  end

end
