repositories_filename = Rails.root.join('config/seeds/repositories.yml')
repositories_file = File.read(repositories_filename)
repositories = YAML.safe_load(repositories_file)

repositories.each { |attributes| Repository.create!(attributes) }
