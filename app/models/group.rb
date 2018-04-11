class Group < ApplicationRecord
    has_and_belongs_to_many :users, :join_table => "groups_users"
    has_many :posts

    has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "https://www.publicdomainpictures.net/pictures/40000/velka/question-mark.jpg"
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
                           