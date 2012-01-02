$LOAD_PATH.unshift File.dirname(__FILE__)

require 'timer'
require 'ui/menu'
require 'mesh'

class Application
  include Timer

  def initialize
    @mesh, @menu = nil, nil
    @filepath = parse_arguments
  end

  def run
    @mesh, generation_time = realtime { Mesh::Model.new @filepath }
    puts "Siatka wygenerowana w %.2f ms." % generation_time

    @menu = UI::Menu.new @mesh
    @menu.run
  end

private
  def parse_arguments
    filepath = ARGV[0]
    unless filepath && File.file?(filepath)
      puts "usage: ruby #{$0} <filepath>"
      abort
    end
    filepath
  end
end

Application.new.run
