# encoding: utf-8

require "dotum"
require "dotum/externs/json"

class Dotum::Rules::Sublime3Keymap < Dotum::AbstractRules::GlobbableFiles

  KEYMAP_JSON_GENERATION_OPTIONS = {
    :indent    => "",
    :space     => " ",
    :object_nl => "",
    :array_nl  => ""
  }

  optional(:destination) { |v| sublime3_data_dir.join("Packages", "User", v) }

private

  def execute
    merged = existing_content + JSON.parse(@source.read)
    merged.uniq!

    # Pretty JSON
    File.open(@destination, "w") do |file|
      file.print("[\n")
      merged.each_with_index do |config, i|
        file.print("\t")
        file.print(JSON.generate(config, KEYMAP_JSON_GENERATION_OPTIONS))
        file.print(",") if i < merged.length - 1
        file.print("\n")
      end
      file.print("]\n")
    end
  end

  def existing_content
    return [] unless @destination.exists?

    JSON.parse(@destination.read)
  end

end
