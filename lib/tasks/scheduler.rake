desc "scale the web dynos"
task scale_up: :environment do
  heroku = Heroku::API.new
  heroku.post_ps_scale(ENV['APP_NAME'], 'web', ENV['HEROKU_WEB_HIGH'])
end

task scale_down: :environment do
  heroku = Heroku::API.new
  heroku.post_ps_scale(ENV['APP_NAME'], 'web', ENV['HEROKU_WEB_LOW'])
end
