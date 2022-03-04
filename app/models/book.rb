class Book < ApplicationRecord
  belongs_to :user
  has_many :books
 # validates :title, :cover, :location, :condition, :category, :year, :author, :description, :language, presence: true
  
  geocoded_by :location
  after_validation :geocode

  #include PgSearch::Model
  #pg_search_scope :global_search,
    #against: [ :title, :author],
    #associated_against: {
      #author: [ :first_name, :last_name ]
   # },
    #using: {
      #tsearch: { prefix: true }
   # }
end
