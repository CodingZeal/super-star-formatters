require "rspec/core/formatters/base_text_formatter"
require "thor"

class Asker < Thor
end

class DHHFormatter < RSpec::Core::Formatters::BaseTextFormatter
  MESSAGES = [
    "This damn thing is useless...",
    "I wouldn't need to test this...",
    "WTF ARE YOU DOING?!"
  ]

  def example_started(example)
    sleep 1
    puts "\n"
    say MESSAGES.sample
    puts "\n"
    sleep 1
  end


  def example_passed(example)
    puts ">>>> RUNNING '#{example.description}'"
    puts ">>>> PASSED... but, it's probably still crap"
  end

  def example_failed(example)
    puts ">>>> RUNNING '#{example.description}'"
    puts ">>>> FAILED -> I told you TDD was crap"
  end

  def close
    puts `figlet Fuck Off !!`
  end

  private

  def ask(question)
    Asker.new.ask(question)
  end

  def say(message)
    Asker.new.say(message)
  end
end