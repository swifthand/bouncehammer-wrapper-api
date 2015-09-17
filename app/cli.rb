module BounceHammerAPI
  class CLI

    attr_reader :bin_path

    def initialize(bin_path = BounceHammerAPI.bin_path)
      @bin_path = bin_path
    end

    def logger(args = '')
      raise NotImplementedError.new("Not yet used by any API routes.")
      run_cli('logger', args)
    end

    def datadumper(args = '')
      run_cli('datadumper', args)
    end

    def summarizer(args = '')
      raise NotImplementedError.new("Not yet used by any API routes.")
      run_cli('summarizer', args)
    end

    def messagetoken(args = '')
      raise NotImplementedError.new("Not yet used by any API routes.")
      run_cli('messagetoken', args)
    end

    def run_cli(exectuable_name, argstring)
      `#{File.join(bin_path, exectuable_name)} #{argstring}`
    end

  end
end
