class User < ActiveRecord::Base

    has_many :sent_shouts,
        :foreign_key => 'sender', :class_name => 'Shout'
    has_many :recieved_shouts,
        :foreign_key => 'reciever', :class_name => 'Shout'

end
