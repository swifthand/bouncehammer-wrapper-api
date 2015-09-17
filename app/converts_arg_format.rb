module BounceHammerAPI
  class ConvertsArgFormat

    attr_reader :options

    def initialize(options)
      @options = options
    end

    def hash_to_cli(arg_hash)
      cli_argstring = ""
      arg_hash.slice(*options.flag_options).each_pair do |option, val|
        next unless val == true
        cli_argstring << " --#{option}"
      end
      arg_hash.slice(*options.value_options).each_pair do |option, val|
        cli_argstring << " --#{option} #{val}"
      end
      cli_argstring
    end


    def cli_to_hash(args_array)
      options.parse_cli!(cli_argstring)
    end


    def splat_to_hash(splat_str)
      splat_as_cli = splat_str.split('/').map do |elt|
        if options.flag_option?(elt) || options.value_option?(elt)
          "--#{elt}"
        else
          elt
        end
      end
      cli_to_hash(splat_as_cli)
    end

  end
end


