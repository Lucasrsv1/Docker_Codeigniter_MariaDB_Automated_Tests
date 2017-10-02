require 'capybara'
require 'capybara/cucumber'
require 'capybara-screenshot/cucumber'
require 'rest-client'

# Preencha a url abaixo com a rota de limpeza do banco e descomente a linha 59
$url_limpa_banco = ""

Capybara.configure do |config|
	config.app_host = ENV['APP_HOST'] || 'http://web:8000'
end

if ENV['SELENIUM_REMOTE_HOST']
	Capybara.register_driver :selenium do |app|
		Capybara::Selenium::Driver.new(app,
		:browser => :remote,
		:url => "http://#{ENV['SELENIUM_REMOTE_HOST']}/wd/hub")
	end
	Capybara.default_driver = :selenium
	Capybara.app_host = ENV['APP_HOST']
	Capybara.server_host = '0.0.0.0'
	Capybara.server_port = '8000'
	Capybara.default_max_wait_time = 5
	Capybara.page.driver.browser.manage.window.resize_to(1800, 1600)
end

current_path = File.dirname(__FILE__)
Capybara.save_path = "#{current_path}/../../screenshots"
Capybara::Screenshot.prune_strategy = { keep: 5 }

Before do |scenario|
	limpa_banco
	visit('/')
end

After do |scenario|
	visit(ENV['APP_HOST'])
end

$falha = false

After do |scenario|
 	if not scenario.status == :passed
		$falha = true
	end
end

at_exit do
	if $falha
		puts "Um ou mais cenarios falharam!"
		Capybara::Screenshot.screenshot_and_save_page
		exit 1
	end
end

World(Capybara)

def limpa_banco
	#doDelete($url_limpa_banco, nil)
end