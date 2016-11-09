def say_as(value,type)
    wait(10000)
    ssml_start="<?xml version='1.0'?><speak>"
    ssml_end="</say-as></speak>"
    ssml ="<say-as interpret-as='vxml:#{type}'>#{value}"
    complete_string = ssml_start + ssml + ssml_end
    say complete_string
end

say_as('USD51.33','currency')
say_as('20314253','digits')
say_as('2031.435','number')
say_as('4075551212','phone')
say_as('20090226','date')
say_as('0515a','time')
