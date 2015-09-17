module BounceHammerAPI
  def self.settings
    @settings ||= JSON.parse(File.read(File.expand_path('../settings.json', __FILE__)))
  end

  def self.bin_path
    @bin_path ||= self.settings['bounceHammerBinDir']
  end

  def self.run_cli(exectuable_name, argstring)
    `#{File.join(bin_path, exectuable_name)} #{argstring}`
  end

  def self.logger(args = '')
    raise NotImplementedError.new("Not yet used by any API routes.")
    run_cli('logger', args)
  end

  def self.datadumper(args = '')
    raise NotImplementedError.new("Not yet used by any API routes.")
    run_cli('datadumper', args)
  end

  def self.summarizer(args = '')
    raise NotImplementedError.new("Not yet used by any API routes.")
    run_cli('summarizer', args)
  end

  def self.messagetoken(args = '')
    raise NotImplementedError.new("Not yet used by any API routes.")
    run_cli('messagetoken', args)
  end

end
