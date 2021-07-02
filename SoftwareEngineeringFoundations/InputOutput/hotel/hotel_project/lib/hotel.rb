require_relative "room"
require 'byebug'

class Hotel
  def initialize(name, hash)
    @name = name
    @rooms = Hash.new
    hash.each {|k, v| @rooms[k]= Room.new(v)}
  end

  def name
    @name.split(" ").map {|w| w[0].upcase + w[1..-1].downcase}.join(" ")
  end

  def rooms
    @rooms
  end

  def room_exists?(room)
    if @rooms.keys.include?(room)
        return true
    else
        return false
    end
  end

  def check_in(person, room)
    if !room_exists?(room)
        print 'sorry, room does not exist'
    else
        if self.rooms[room].add_occupant(person)
            print 'check in successful'
        else
            print 'sorry, room is full'
        end
    end
  end

  def has_vacancy?
    if self.rooms.each_value.all? {|v| v.full?}
        return false
    else
        return true
    end
  end

  def list_rooms
    @rooms.each do |k, v|
        print k + ' ' + v.available_space.to_s
        puts
    end
  end
end
