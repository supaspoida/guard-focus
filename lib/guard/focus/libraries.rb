require 'ostruct'

module Guard
  class Focus
    class Libraries < OpenStruct
      def self.cucumber
        new base_path:    'features',
            focus_regexp: /^\s*@focus/,
            executable:   'cucumber',
            extension:    '.feature'
      end

      def self.rspec
        new base_path:    'spec',
            focus_regexp: /^\s*(describe|context|it).*?(:focus|focus:)/,
            executable:   'rspec',
            extension:    '_spec.rb'
      end

      def self.[](name)
        { cucumber: cucumber,
          rspec:    rspec     }[name]
      end
    end
  end
end
