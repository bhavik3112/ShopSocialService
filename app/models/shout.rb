class Shout < ActiveRecord::Base

    belongs_to :user, 
        :foreign_key => 'sender', :class_name => 'User'
    belongs_to :user, 
        :foreign_key => 'reciever', :class_name => 'User'

end
