class ContactsController < ApplicationController
  def show
        @contact = Contact.find(params[:id])
  end

  def new
        @contact = Contact.new
    end

  def create
    @contact = Contact.new(contact_params)
    respond_to do |format|
    if @contact.save
    ContactMailer.send_signup_email(@contact).deliver
    format.html { redirect_to(@contact, :notice => 'User was successfully created.') }  
    format.xml  { render :xml => @contact, :status => :created, :location => @contact }  
    else  
      format.html { render :action => "new" }  
      format.xml  { render :xml => @contact.errors, :status => :unprocessable_entity }  
    end  
    end
        
  end
  
def index
end


private
  def contact_params
    params.require(:contact).permit(:name,:email,:phone,:address,:subject,:message)
  end

end
