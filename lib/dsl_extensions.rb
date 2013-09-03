# encoding: utf-8

require "dotum"

Dotum::RuleDSL.module_eval do

  SUBLIME_JSON_GENERATION_OPTIONS = {
    :indent    => "\t",
    :space     => " ",
    :object_nl => "\n",
    :array_nl  => "\n"
  }

  def sublime2_data_dir
    return @@sublime2_data_dir if defined? @@sublime2_data_dir

    if platform? "osx"
      path = "Library/Application Support/Sublime Text 2"
    elsif platform? "windows"
      path = "#{ENV["APPDATA"]}/Sublime Text 2"
    else
      path = ".config/sublime-text-2"
    end

    @@sublime2_data_dir = target_dir.join(path)
  end

  def sublime3_data_dir
    return @@sublime3_data_dir if defined? @@sublime3_data_dir

    if platform? "osx"
      path = "Library/Application Support/Sublime Text 3"
    elsif platform? "windows"
      path = "#{ENV["APPDATA"]}/Sublime Text 3"
    else
      path = ".config/sublime-text-3"
    end

    @@sublime3_data_dir = target_dir.join(path)
  end

end
