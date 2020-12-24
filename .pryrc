def me
  User.find(39930941)
end

def decode_cookie(cookie_orig)
  config = Rails.application.config
  app = config.session_store.new(nil, config.session_options)
  sess = app.load_session(Rails.application.send(:build_request, {'HTTP_COOKIE'=>"_huntr_session_#{Rails.env}=#{cookie_orig}"}))
  app.send(:unpacked_cookie_data, Rails.application.send(:build_request, {'HTTP_COOKIE'=>"_huntr_session_#{Rails.env}=#{cookie_orig}"}))
end

def pbcopy
  IO.popen("pbcopy", "w+") do |io|
    io.puts self.to_s
    io.close_write
  end
end

def pbcopy(str)
  IO.popen('pbcopy', 'r+') {|io| io.puts str }
  _pry_.output.puts text.green("--- Copy to ClipBoard ---")
  _pry_.output.puts str
end

Pry.config.commands.command "copy-history", "History copy to clipboard" do |n|
  pbcopy _pry_.input_ring[n ? n.to_i : -1]
end

Pry.config.commands.command "copy-result", "Last result copy to clipboard" do
  pbcopy _pry_.last_result
end

Pry.config.commands.command "copy", "Copy to clipboard" do |str|
  unless str
    str = "#{_pry_.input_ring[-1]}#=> #{_pry_.last_result}\n"
  end
  pbcopy str
end

Pry.config.commands.alias_command 'cp', 'copy'
Pry.config.commands.alias_command 'cph', 'copy-history'
Pry.config.commands.alias_command 'cpr', 'copy-result'



