$LOAD_PATH.unshift File.dirname(__FILE__)

require 'mesh'
require 'ui/menu'

mesh = Mesh::Model.new ARGV[0]
menu = UI::Menu.new mesh

menu.run
