class User < ActiveRecord::Base

    has_many :sent_shouts,
        :foreign_key => 'sender', :class_name => 'Shout'
    has_many :recieved_shouts,
        :foreign_key => 'reciever', :class_name => 'Shout'

    def find_by_phone(phone)
        User.find(:all, :conditions => {:phone => phone})
    end

    def find_by_email(email)
        User.find(:all, :conditions => {:email => email})
    end

end
