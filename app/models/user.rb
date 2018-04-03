class User < ApplicationRecord
    has_secure_password
    has_and_belongs_to_many :groups

    has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "http://www.porticodesign.com/wp-content/uploads/2014/03/blank-person-07d1653f840307220b203ecb834f5904.png"
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

    scope :super_admin, lambda { where(:is_super_DMIN => true) }
    scope :search, lambda {|query| where(["display_name LIKE ?", "%#{query}%"])}

end
