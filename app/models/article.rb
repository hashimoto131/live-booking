class Article < ActiveRecord::Base
  belongs_to :user
  has_many :messages


  validates :title,  presence: true
	#validates :date,   presence: true
	validates :place,  presence: true
	validates :genre,  presence: true
  validates :norma,  presence: true
	validates :detail, presence: true
  validates :area,   presence: true

end
