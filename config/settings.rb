module BounceHammerAPI
  def self.settings
    @settings ||= settings_from_file
  end

  def self.settings=(settings_hash)
    @settings = settings_hash
  end

  def self.settings_from_file
    JSON.parse(File.read(File.expand_path('../settings.json', __FILE__)))
  end

  def self.bin_path
    @bin_path ||= self.settings['bounceHammerBinDir']
  end

end
