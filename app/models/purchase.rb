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
    logger.debug "Sending SMS"
  end
end
