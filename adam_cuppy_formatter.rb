require "rspec/core/formatters/base_text_formatter"
require "thor"

class Asker < Thor
end

class AdamCuppyFormatter < RSpec::Core::Formatters::BaseTextFormatter
  def example_started(example)
    response = ask "Does your factory create an MVO (and only an MVO)?"
    if response == "y"
      puts("\n")
      say(">>>> Ok... we'll give it a shot!")
      puts("\n")
      return
    end
  end

  def example_passed(example)
    puts ">>>> RUNNING '#{example.description}'"
    puts ">>>> PASSED... but, that doesn't mean it's DRY"
  end

  def example_failed(example)
    puts ">>>> RUNNING '#{example.description}'"
    puts ">>>> FAILED -> Better luck next time! Come to my RSpec conference in October and become a master!"
  end

  private

  def ask(question)
    Asker.new.ask(question)
  end

  def say(message)
    Asker.new.say(message)
  end
end
