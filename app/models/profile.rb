class Profile < ApplicationRecord
  has_attached_file :avatar, styles: { large: "600x600>",medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
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
