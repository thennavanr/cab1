class ContactsController < ApplicationController
  def show
  end

  def new
        @contact = Contact.new
    end

  def create
    @contact = Contact.new(contact_params)
    @contact.save
    redirect_to @contact
        
  end
  
def index
end


private
  def contact_params
    params.require(:contact).permit(:name,:email,:phone,:address,:subject,:message)
  end

end
