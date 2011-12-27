require 'scanf'

module Mesh
  class Model
    attr_reader :faces, :vertices, :edges

    def initialize filepath
      @faces = FacesHash.new
      @vertices = VerticesHash.new
      @edges = EdgesHash.new

      parse_file filepath
      generate_face_vertex_model
      generate_half_edge_model
    end

  private
    def parse_file filepath
      patterns = {
        :id     => /\d+/,
        :float  => /[\+\-]?\d+\.[\+\-e\d]+/
      }
      patterns[:vertex] = /^\s*(?<id>#{patterns[:id]})\s*\(\s*(?<x>#{patterns[:float]}),\s*(?<y>#{patterns[:float]}),\s*(?<z>#{patterns[:float]})\s*\)/
      patterns[:face]   = /^\s*(?<id>#{patterns[:id]})\s+(?<v1>#{patterns[:id]})\s+(?<v2>#{patterns[:id]})\s+(?<v3>#{patterns[:id]})/

      File.open filepath do |file|
        file.each do |line|
          if match = line.match(patterns[:vertex])
            id = match[:id].to_i
            coordinates = [match[:x], match[:y], match[:z]].map{ |v| v.to_f }
            @vertices.add id, *coordinates
          elsif match = line.match(patterns[:face])
            id = match[:id].to_i
            vertices = [match[:v1], match[:v2], match[:v3]].map{ |v| @vertices[v.to_i] }
            @faces.add id, *vertices
          else
            next
          end
        end
      end
    end

    def generate_face_vertex_model
      @faces.each do |face|
        next if face.nil?
        face.vertices.each do |vertex|
          vertex.faces << face
        end
      end
    end

    def generate_half_edge_model
      @faces.each do |face|
        next if face.nil?
        @edges.generate_edges face
      end
    end
  end
end
