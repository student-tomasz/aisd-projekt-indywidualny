module UI
  class Menu
    def initialize mesh
      @mesh = mesh
    end

    def run
      while true
        show_help
        run_action
        wait
      end
    end

  private
    
    def show_help
      puts 'Akcje: '
      puts '  1. indeksy wezlow podanego elementu,'
      puts '  2. indeksy wezlow bezposrednio sasiadujacych z podanym wezlem,'
      puts '  3. indeksy elementow bezposrednio sasiadujacych z podanym wezlem,'
      puts '  4. indeksy wezlow podanej krawedzi,'
      puts '  5. indeksy elementow przyleglych do podanej krawedzi,'
      puts '  6. indeksy wezlow bezposrednio sasiadujacych z podana krawedzia,'
      puts '  7. indeksy elementow bezposrednio sasiadujacych z podana krawedzia,'
      puts '  8. indeksy krawedzi bezposrednio sasiadujacych z podana krawedzia,'
      puts '  9. koniec.'
    end

    def run_action
      print 'Podaj ID akcji: '
      action_id = read_input

      case action_id
      when 1
        print 'Podaj ID elementu: '
      when 2, 3
        print 'Podaj ID wezla: '
      when 4..8
        print 'Podaj ID krawedzi: '
      when 9
        puts 'Koniec programu.'
        exit
      else
        puts "Akcja o ID #{action_id} jest nieznana."
        puts "Znamy tylko akcje z zakresu (1..9)."
        return
      end
      id = read_input

      if id
        case action_id
        when 1
          face_action action_id, id
        when 2, 3
          vertex_action action_id, id
        when 4..8
          edge_action action_id, id
        end
      end
    end

    def face_action action_id, id
      face = @mesh.faces[id]
      if face
        puts "Wezly elementu #{id} to #{face.vertices_ids}."
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
          puts "Wezly sasiadujace z wezlem #{id} to #{vertex.adjacent_vertices_ids}."
        when 3
          puts "Elementy sasiadujace z wezlem #{id} to #{vertex.faces_ids}."
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
        when 4
          puts "Wezly nalezace do krawedzi #{id} to #{edge.vertices_ids}."
        when 5
          puts "Elementy przylegle do krawedzi #{id} to #{edge.faces_ids}."
        when 6
          puts "Wezly sasiadujace z krawedzia #{id} to #{edge.adjacent_vertices_ids}."
        when 7
          puts "Elementy sasiadujace z krawedzia #{id} to #{edge.adjacent_faces_ids}."
        when 8
          puts "Krawedzie sasiadujace z krawedzia #{id} to #{edge.adjacent_edges_ids}."
        end
      else
        puts "Krawedz o ID #{id} nie istnieje."
        nil
      end
    end

    def wait
      STDIN.gets
      puts
    end

    def read_input
      number = nil
      begin 
        number = STDIN.gets
      rescue
        puts 'Koniec programu. Problem z czytaniem STDIN.'
        abort
      end

      if number
        number = number.chomp.to_i
        if number == 0
          puts 'Argument nie rozpoznany.'
          puts "Przyjmowane sa tylko ID w postaci liczb naturalnych bez '0'."
          nil
        else
          return number
        end
      else
        puts 'Koniec programu. Problem z parsowaniem STDIN.'
        abort
      end
    end
  end
end