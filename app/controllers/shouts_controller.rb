class ShoutsController < ApplicationController

    def index
        # Check which arguments are passed
        if params[:phone]
            @user = User.find_by_phone params[:phone]
        elsif params[:email]
            @user = User.find_by_email params[:email]         
        end

        if @user.nil?
            @shouts = Shout.all
        else
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

    def create
        # Get the sender
        if params[:sender]
            if params[:sender].match('@').nil?
                @sender = User.find_by_phone params[:sender]
            else
                @sender = User.find_by_email params[:sender]
            end
        end

        # Get the receiver
        if params[:receiver]
            if params[:receiver].match('@').nil?
                @receiver = User.find_by_phone params[:receiver]
            else
                @receiver = User.find_by_email params[:receiver]
            end
        end

        if !@sender.nil? && !@receiver.nil?
            @shout = Shout.new(:sender => @sender,
                :reciever => @receiver,
                :message => params[:message],
                :asin => params[:asin])
            @shout.save
        end

        respond_to do |format|
            if @shout
                format.xml{
                    render :xml => @shout.to_xml(:include => [:sender, :reciever])
                }
            else
                format.html
            end
        end

    end

end
