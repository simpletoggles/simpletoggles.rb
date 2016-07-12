require "simple_toggles/version"

module SimpleToggles
  def self.enabled?(toggle_name)
    enabled_toggles = ENV['ENABLED_TOGGLES'] || []
    enabled_toggles.include? toggle_name
  end
end
