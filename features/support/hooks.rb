Before do |scenario|
  if scenario.outline?
    scenario.cell_values.first << (' -=- ' + ENV['PLATFORM'])
  else
    scenario.name << (' -=- ' + ENV['PLATFORM'])
  end

  $scenario = scenario

  begin
    antes = Time.now

    start_driver 

  rescue StandardError => e
    filename = 'error.txt'
    now = Time.at(Time.now - antes).utc.strftime '%M:%S'
    sec = Time.at(Time.now - antes).sec
    min = Time.at(Time.now - antes).min
    debug = now + ' - ' + scenario.name + ': ' + e.message + "\n"
    p(min.to_s + ':' + sec.to_s)
    File.write(filename, debug, mode: 'a')
    raise e.message
  end
  set_wait 1


end
After do |scenario|
  filename = 'rerun-' + ENV['PLATFORM'] + '.txt'
  
  if scenario.failed?
    begin
      failed_scenario = scenario.location.file + ':' + scenario.location.line.to_s + "\n"

      File.write(filename, failed_scenario, mode: 'a') unless File.file?(filename) && File.new(filename, 'r').read.include?(failed_scenario)
    rescue StandardError
    end
    
    dir = "#{ENV['PWD']}/screenshots/#{ENV['PLATFORM']}"
    file = "#{dir}/#{Time.now.strftime('%Y_%m_%d_%Y_%H_%M_%S')}.png"
    begin
      i ||= 1
      screenshot(file)
      wait(40) { embed file, 'image/png', 'screenshot - ' + ENV['PLATFORM'] }
    rescue Appium::Core::Wait::TimeoutError, NoMethodError, Selenium::WebDriver::Error::UnknownError
      i -= 1
      retry if i.zero?
    end
  end

  begin
    close_app
  
  rescue StandardError
  end
  ReleaseHubNode.node_session session_id unless ENV['HUB'].nil?
  begin
    driver_quit
  rescue StandardError => e
    puts e.to_s
  end
end
