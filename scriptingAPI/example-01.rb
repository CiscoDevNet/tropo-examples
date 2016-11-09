def voice_response
  result = ask "Press 1 for English or 2 for Spanish ", {
   :choices => "1, 2",
   :attempts => 3,
   :mode => "dtmf"
  }

  if result.value == "1"
    say "Welcome to Cisco Live Cancun. Isn't Tropo awesome?"
  elsif result.value == "2"
    say "Bienvenido a Cisco Live Cancún. No se Tropo impresionante?"
  else
    say "Welcome to Cisco Live Cancun. Isn't Tropo awesome?"
  end
end

def sms_response
  text = "Thanks for texting! We hope you're enjoying Cisco Live Cancun! "
  text = text + "This script was written in Ruby version #{RUBY_VERSION}"
  say text
end


if ($currentCall.network == "SMS")
  sms_response
else
  voice_response
end
