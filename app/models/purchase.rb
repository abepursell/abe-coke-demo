require 'httparty'

class Purchase < ActiveRecord::Base

  before_create :create_code
  after_create :send_sms

  validates :sender_name, presence: true
  validates :cell_number, presence: true
  validates :recipient_name, presence: true
  validates :drink_type, presence: true

  DRINK_TYPES = ["Coca-Cola", "Diet Coke", "Coke Zero", "Sprite", "Fanta"]

  def self.drink_types
    DRINK_TYPES
  end

  private

  def create_code
    self.code = String.random.to_slug.upcase
  end

  def send_sms
    request_data = { :To => self.cell_number, :Body => "Hey #{self.recipient_name}, #{self.sender_name} has bought you a #{self.drink_type}.  Use code #{self.code.upcase} to redeem at your nearest participating vending machine.", :Token => ENV['TELAPI_TOKEN'] }
    if Rails.env.production?
      r = HTTParty.post("https://heroku.telapi.com/send_sms", :body => request_data)
    else
      r = HTTParty.post("http://dev.mydomain.com:5000/send_sms", :body => request_data)
    end
  end
end
