command_set = Pry::CommandSet.new do
  command "pbcopy", "copy previous result to clipboard" do |s|
    puts s
    IO.popen('pbcopy', 'w') { |f| f << s }
  end
end
Pry.config.commands.import command_set





