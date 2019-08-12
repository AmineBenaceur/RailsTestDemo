class Article < ApplicationRecord
    validates :title, presence: true, 
                    length: {minimum: 5} #validates data sent to models
end
