module BounceHammerAPI
  class DataDumper

    attr_reader :cli, :args, :argstring

    def initialize(arguments_hash)
      @cli        = CLI.new
      @args       = arguments_hash.merge({ 'format' => 'j' })
      @argstring  = build_args_for_cli(@args)
    end

    def build_args_for_cli(hash)
      ConvertsArgFormat.new(DataDumperOptions.new).hash_to_cli(hash)
    end

    def results
      @results ||= run_cli
    end

    def run_cli
      output = cli.datadumper(argstring)
      output.blank? ? "[]" : output
    end

  end
end
