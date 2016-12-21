class Profile < ApplicationRecord
  has_attached_file :avatar, styles: { large: "600x600#",medium: "300x300#", small: "200x200#", thumb: "100x100#" }, default_url: "profilepic_creative.png", secondarydefault_url: "profiledefault.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  belongs_to :user
  has_many :employments
  has_many :messages



  def full_name
    "#{firstname} #{lastname}"
  end

  def self.search(search)
    if search
      where('city ILIKE ? OR firstname ILIKE ? OR lastname ILIKE ? OR role ILIKE ? OR company ILIKE?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      all
    end
  end

end
