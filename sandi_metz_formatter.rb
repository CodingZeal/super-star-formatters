require "rspec/core/formatters/base_text_formatter"
require "thor"

class Asker < Thor
end

class SandiMetzFormatter < RSpec::Core::Formatters::BaseTextFormatter
  def example_started(example)
    first_response = ask "Do you need to test that? (y/n)"

    if first_response == "y"
      second_response = ask("Are you sure? (y/n)")

      if second_response == "y"
        third_response = ask("Are you REALLY REALLY sure?? (y/n)")

        if third_response == "y"
          puts("\n")
          say(">>>> Ok... but, just this once.")
          puts("\n")
          return
        else
          say_deleted
        end
      else
        say_deleted
      end
    else
      say_deleted
    end
  end

  private

  def ask(question)
    Asker.new.ask(question)
  end

  def say(message)
    Asker.new.say(message)
  end

  def say_deleted
    say ">>>> TEST DELETED <<<<"
  end
end