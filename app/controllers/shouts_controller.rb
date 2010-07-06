class ShoutsController < ApplicationController

    def shouts

        # Check which arguments are passed
        if params[:phone]
            @user = User.find_by_phone params[:phone]
        elsif params[:email]
            @user = User.find_by_email params[:email]         
        end

        if @user.nil?
            return
        end

        # Check what needs to be returned
        if params[:type]
            if params[:type].eql? "sent"
                @shouts = @user.sent_shouts
            elsif params[:type].eql? "recv"
                @shouts = @user.recieved_shouts
            elsif params[:type].eql? "all"
                @shouts = @user.sent_shouts +
                    @user.recieved_shouts
            end 
        else
            @shouts = @user.sent_shouts + 
                @user.recieved_shouts
        end

        respond_to do |format|
            format.xml {
                if @shouts
                    render :xml => @shouts.to_xml(
                        :include => [:sender, :reciever])
                end
            }
        end          

    end
    
end
