# coding: utf-8
require 'gemoji'

module Emojify
  module Keywords
    KERNEL_METHODS = {
      'fire' => 'raise'
    }

    NEW_METHODS = {
      'thumbsup'   => 'true',
      'thumbsdown' => 'false'
    }

    def self.included(base)
      KERNEL_METHODS.each do |(emoji, method)|
        base.send :alias_method, Emoji.find_by_alias(emoji).raw, method
      end

      NEW_METHODS.map do |(emoji, method)|
        base.class_eval "def #{Emoji.find_by_alias(emoji).raw}; #{method}; end"
      end
    end
  end
end
