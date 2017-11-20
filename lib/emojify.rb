require 'emojify/version'
require 'emojify/keywords'

module Emojify
  def self.emojify!
    Kernel.include(Emojify::Keywords)
  end
end
