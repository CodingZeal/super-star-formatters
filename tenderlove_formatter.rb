require "rspec/core/formatters/base_text_formatter"
require "thor"

class Asker < Thor
end

class TenderloveFormatter < RSpec::Core::Formatters::BaseTextFormatter
  IMAGES = [
    './images/tenderlove.png',
    './images/aaron-patterson.png'
  ]
  def close
    `open ./spec/formatters/tenderlove.png`
  end
end