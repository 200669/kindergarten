class Child < ActiveRecord::Base
  has_many :stays
  
  validates :name, :lastname, :birthdate, presence: true
  validates :pesel, presence: true, uniqueness: true, format: {with: /\A[0-9]{11}\z/, message: " nieprawidłowy format"}, length: { is: 11 }, pesel: true
  validates :barcode, presence: true, uniqueness: true
end
