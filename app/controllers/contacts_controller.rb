class ContactsController < ApplicationController
  def show
  end

  def new
        @contact = Contact.new
    end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
            redirect_to contacts_path,  :notice => "Your contact was saved"
        else
            render "new"
        end 
  end
  
def index
end


private
  def contact_params
    params.require(:contact).permit(:name,:email,:phone,:address,:subject,:message)
  end

end
