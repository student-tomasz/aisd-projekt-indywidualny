profiles_data = FileList[*%w{
	profiles/0-mesh_initialization.pprof
	profiles/1-vertices_of_a_face.pprof
	profiles/2-adjacent_vertices_of_a_vertex.pprof
	profiles/3-faces_of_a_vertex.pprof
	profiles/4-edges_of_a_vertex.pprof
	profiles/5-vertices_of_an_edge.pprof
	profiles/6-faces_of_an_edge.pprof
	profiles/7-adjacent_vertices_of_an_edge.pprof
	profiles/8-adjacent_faces_of_an_edge.pprof
	profiles/9-adjacent_edges_of_an_edge.pprof
}]
profiles = profiles_data.map { |path| path.sub '.pprof', '.pdf' }

task :run do
	sh 'ruby application.rb meshes/large.txt'
end

task :debug => 'meshes/micro.txt' do
	sh 'bundle exec ruby debugging.rb meshes/micro.txt'
end

rule '.pprof' do
	sh 'bundle exec ruby profiling.rb meshes/large.txt'
end

rule '.pdf' => '.pprof' do |r|
	begin
	  sh "bundle exec pprof.rb --pdf #{r.source} > #{r.name}"
	rescue
		nil
	end
end

task :profile => profiles do
	begin
		rm profiles_data
		rm profiles_data.map { |file| file + '.symbols' }
	rescue
		nil
	end
end

task :install do
	sh 'bundle install'
end
