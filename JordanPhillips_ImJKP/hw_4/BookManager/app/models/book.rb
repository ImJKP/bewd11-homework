class Book < ActiveRecord::Base

  has_many :store

  validates :title,
    presence: true
    
  validates :author,
    presence: true

end
