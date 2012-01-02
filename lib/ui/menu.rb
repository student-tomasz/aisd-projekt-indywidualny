require 'timer'

module UI
  class Menu
    include Timer

    def initialize mesh
      @mesh = mesh
    end

    def run
      show_help
      write_rule
      while true
        run_action
        write_rule
      end
    end

  private
    
    def show_help
      puts 'Akcje: '
      puts '  1. indeksy wezlow podanego elementu,'
      puts '  2. indeksy wezlow bezposrednio sasiadujacych z podanym wezlem,'
      puts '  3. indeksy elementow bezposrednio sasiadujacych z podanym wezlem,'
      puts '  4. indeksy krawedzi podanego wezla,'
      puts '  5. indeksy wezlow podanej krawedzi,'
      puts '  6. indeksy elementow przyleglych do podanej krawedzi,'
      puts '  7. indeksy wezlow bezposrednio sasiadujacych z podana krawedzia,'
      puts '  8. indeksy elementow bezposrednio sasiadujacych z podana krawedzia,'
      puts '  9. indeksy krawedzi bezposrednio sasiadujacych z podana krawedzia,'
      puts '  -'
      puts '  h. pomoc,'
      puts '  q. koniec.'
    end

    def run_action
      print 'Podaj ID akcji: '
      action_id = read_input

      case action_id
      when 1
        print 'Podaj ID elementu: '
      when 2..4
        print 'Podaj ID wezla: '
      when 5..9
        print 'Podaj ID krawedzi: '
      when 'h'
        show_help
        return
      when 'q'
        puts 'Koniec programu.'
        exit
      else
        puts 'Akcja o podanym ID jest nieznana.'
        puts 'Znamy tylko akcje z zakresu (1..9).'
        return
      end
      id = read_input

      if id
        case action_id
        when 1
          face_action action_id, id
        when 2..4
          vertex_action action_id, id
        when 5..9
          edge_action action_id, id
        end
      end
    end

    def face_action action_id, id
      face = @mesh.faces[id]
      if face
        write_results "Wezly elementu", face, :vertices
      else
        puts "Element o ID #{id} nie istnieje."
        nil
      end
    end

    def vertex_action action_id, id
      vertex = @mesh.vertices[id]
      if vertex
        case action_id
        when 2
          write_results "Wezly sasiadujace z wezlem", vertex, :adjacent_vertices
        when 3
          write_results "Elementy sasiadujace z wezlem", vertex, :faces
        when 4
          write_results "Krawedzie wezla", vertex, :edges
        end
      else
        puts "Wezel o ID #{id} nie istnieje."
        nil
      end
    end

    def edge_action action_id, id
      edge = @mesh.edges[id]
      if edge
        case action_id
        when 5
          # puts "Wezly nalezace do krawedzi #{id} to #{edge.vertices}."
          write_results "Wezly nalezace do krawedzi", edge, :vertices
        when 6
          # puts "Elementy przylegle do krawedzi #{id} to #{edge.faces}."
          write_results "Elementy przylegle do krawedzi", edge, :faces
        when 7
          # puts "Wezly sasiadujace z krawedzia #{id} to #{edge.adjacent_vertices}."
          write_results "Wezly sasiadujace z krawedzia", edge, :adjacent_vertices
        when 8
          # puts "Elementy sasiadujace z krawedzia #{id} to #{edge.adjacent_faces}."
          write_results "Elementy sasiadujace z krawedzia", edge, :adjacent_faces
        when 9
          # puts "Krawedzie sasiadujace z krawedzia #{id} to #{edge.adjacent_edges}."
          write_results "Krawedzie sasiadujace z krawedzia", edge, :adjacent_edges
        end
      else
        puts "Krawedz o ID #{id} nie istnieje."
        nil
      end
    end

    def read_input
      input = nil
      begin 
        input = STDIN.gets
      rescue
        puts 'Koniec programu. Problem z czytaniem STDIN.'
        abort
      end
      if input
        input.strip!
        input.chomp!
        parsed = input.to_i
        return parsed if parsed != 0
      end
      return input
    end

    def write_results beginning, object, method
      puts beginning + (" %i to %s. Wykonano w %.2f ms." % [object.id, *realtime { object.send(method) }])
    end

    def write_rule
      puts "---"
      puts
    end
  end
end
