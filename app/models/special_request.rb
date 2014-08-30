class SpecialRequest < ActiveRecord::Base
  belongs_to :reservation


  def get_desc 
    desc = ""
    if request_type.include? 'Distance'
      desc = "Fare for #{request_value} miles"
    elsif request_type.include? 'Tax'
      desc = "Tax 7%"
    elsif request_type.include? 'Gratuity'
      desc = "Gratuity 18%"
    else
      desc = request_type
    end
     desc 
  end
end
