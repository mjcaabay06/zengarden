room = Room.find(1)
room.update_attributes(url: room.name.downcase.gsub!(' ','-'))

room = Room.find(2)
room.update_attributes(url: room.name.downcase.gsub!(' ','-'))

room = Room.find(3)
room.update_attributes(url: room.name.downcase.gsub!('(','').gsub!(')','').gsub!(' ','-'))

room = Room.find(4)
room.update_attributes(url: room.name.downcase.gsub!('(','').gsub!(')','').gsub!(' ','-'))

room = Room.find(5)
room.update_attributes(url: room.name.downcase.gsub!('(','').gsub!(')','').gsub!(' ','-'))

room = Room.find(6)
room.update_attributes(url: room.name.downcase.gsub!('(','').gsub!(')','').gsub!(' ','-'))