module Mesh
  class Model
    attr_reader :faces, :vertices, :edges

    def initialize filepath
      @faces = FacesHash.new
      @vertices = VerticesHash.new
      @edges = EdgesHash.new

      parse_file filepath
      generate_edges
    end

  private
    def parse_file filepath
      faces_count, vertices_count = nil, nil
      File.open filepath do |file|
        faces_count, vertices_count = parse_counts file
        parse_vertices file, vertices_count
        parse_faces file, faces_count
      end
    end

    def parse_counts file
      patterns = {
        :faces_count    => /^\s*Number of elements\s*=\s*(?<count>\d+)/,
        :vertices_count => /^\s*Number of nodes\s*=\s*(?<count>\d+)/
      }
      faces_count, vertices_count = nil, nil

      file.each do |line|
        if match = line.match(patterns[:faces_count])
          faces_count = match[:count].to_i
        elsif match = line.match(patterns[:vertices_count])
          vertices_count = match[:count].to_i
        end
        break if faces_count && vertices_count
      end

      return faces_count, vertices_count
    end

    def parse_vertices file, vertices_count
      file.each do |line|
        next if line.strip.empty? || line.lstrip.start_with?('#')
        line = line.split(/\(,/)
        id = line[0].to_i
        coordinates = [line[1].to_f, line[2].to_f, line[3].to_f]
        @vertices.add id, coordinates
        break if @vertices.length == vertices_count
      end
    end

    def parse_faces file, faces_count
      file.each do |line|
        next if line.strip.empty? || line.lstrip.start_with?('#')
        line = line.split.map { |s| s.to_i }
        id = line[0]
        vertices = [@vertices[line[1]], @vertices[line[2]], @vertices[line[3]]]
        @faces.add id, vertices
        break if @faces.length == faces_count
      end
    end

    def generate_edges
      @faces.each do |face|
        face.vertices_ordered.each do |pair|
          @edges.add pair
        end
      end
      @edges.freeze
    end
  end
end
