require 'guard'
require 'guard/guard'
require 'forwardable'

module Guard
  class Focus < Guard
    autoload :Libraries, 'guard/focus/libraries'

    extend Forwardable

    def_delegators :library, :base_path, :executable, :extension, :focus_regexp

    attr_reader :paths, :focused, :library

    def initialize(watchers=[], options={})
      super
      @library = Libraries[options[:on]]
    end

    def run_all
      success?([base_path])
    end

    def run_on_change(files)
      success?(files)
    end

    private

    def command
      ['time', executable, paths.join(' '), options].compact * ' '
    end

    def has_focus?(file)
      begin
        File.read(file) =~ focus_regexp
      rescue Errno::EISDIR => e
        Dir.glob("#{file}/**/*#{extension}").any? &method(:has_focus?)
      rescue Errno::ENOENT => e
        UI.debug "\e[31mMissing directory: #{base_path}"
      end
    end

    def options
      '--tag @focus' if focused
    end

    def success?(paths)
      @paths   = paths
      @focused = paths.any? &method(:has_focus?)
      UI.info "\nRunning: \e[33m#{command}\n"
      system command
    end
  end
end
