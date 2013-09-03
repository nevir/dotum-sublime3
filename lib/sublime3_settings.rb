# encoding: utf-8

require "dotum"
require "dotum/externs/json"

class Dotum::Rules::Sublime3Settings < Dotum::AbstractRules::GlobbableFiles

  optional(:destination) { |v| sublime3_data_dir.join("Packages", "User", v) }

private

  def execute
    merged = existing_content.merge(JSON.parse(@source.read))
    @destination.write(JSON.generate(merged, SUBLIME_JSON_GENERATION_OPTIONS))
  end

  def existing_content
    return {} unless @destination.exists?

    JSON.parse(@destination.read)
  end

end
