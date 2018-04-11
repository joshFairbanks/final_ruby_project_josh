class Post < ApplicationRecord
    has_many :comments
    belongs_to :group

    has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "https://www.publicdomainpictures.net/pictures/40000/velka/question-mark.jpg"
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end