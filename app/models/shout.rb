class Shout < ActiveRecord::Base

    belongs_to :sender, 
        :foreign_key => 'sender', :class_name => 'User'
    belongs_to :reciever, 
        :foreign_key => 'reciever', :class_name => 'User'

end
