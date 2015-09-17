require 'optparse'

module BounceHammerAPI
  class DataDumperOptions

    def self.value_option?(option)
      VALUE_OPTIONS.any? { |_, long, _| long == option }
    end

    def self.value_options
      VALUE_OPTIONS.map { |_, long, _| long }
    end

    def self.flag_options
      FLAG_OPTIONS.map { |_, long, _| long }
    end

    def self.flag_option?(option)
      FLAG_OPTIONS.any? { |_, long, _| long == option }
    end

    VALUE_OPTIONS = [
      ['a', 'addresser', "Sender's email address."],
      ['r', 'recipient', 'Recipient email address.'],
      ['s', 'senderdomain', "Sender email address' domain part."],
      ['d', 'destination', "Recipient email address' domain part."],
      ['w', 'reason', "Specify a bounce reason (full list via 'why' column of tablectl -tw --list)."],
      ['g', 'hostgroup', "Specify a hostgroup (full list via 'name' column of tablectl -th --list)."],
      ['p', 'provider', "Email provider name (full list via 'name' column of tablectl -tp --list)."],
      ['t', 'token', "Message generated via 'messagetoken' command."],
      ['h', 'howrecent', "Starting date for how far in the past the bounces occurred. Should be in format number/unit where units are s:seconds, m:minutes, h:hours, d:days, w:weeks, y:years. Examples: 20s, 2d, 1y, 6w."],
      ['f', 'frequency', "Minimum number of occurrences for the bounce."],
      ['o', 'orderby', 'Sort order by a specified column, such as addresser or recipeint.'],
      ['O', 'orderbydesc', 'Sort, descending order by a specified column, such as addresser or recipeint.'],
      ["F", "format", "The format is always JSON. Deal with it."],
    ]

    FLAG_OPTIONS = [
      ["a", "alldata", "Dumps all data  in a database except records which the value of 'disabled' column is 1."],
      ["c", "count", "Displays the number of records which are matched by a specified condition."],
    ]


    def value_option?(option)
      self.class.value_option?(option)
    end

    def flag_option?(option)
      self.class.flag_option?(option)
    end

    def value_options
      self.class.value_options
    end

    def flag_options
      self.class.flag_options
    end

    # This is a little more imperative than I would prefer,
    # but it seems that's the way it needs to go here.
    def parse_cli!(arg_list)
      options = {}
      parser  = OptionParser.new do |opts|
        VALUE_OPTIONS.each do |(short, long, message)|
          opts.on("-#{short} MANDATORY", "--#{long} MANDATORY", message) do |val|
            options[long] = val
          end
        end

        FLAG_OPTIONS.each do |(short, long, message)|
          opts.on("-#{short}", "--#{long}", message) do |val|
            options[long] = true
          end
        end

        opts.on("-F", "--format", "The format is always JSON. Deal with it.") do
          options['format'] = 'j'
        end
      end

      parser.parse!(arg_list)
      options
    end
  end
end
