class User < ApplicationRecord

  # Associations

  has_many :created_things, class_name: 'Thing', foreign_key: :creator_id, :dependent => :destroy
 
###########################################################

  before_save {self.email.downcase!}
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, :format => {with: VALID_EMAIL_REGEX}, length: {maximum: 255}, uniqueness: true, if: :email_changed?
  validates :password, presence: true, length: {minimum: 8}, allow_blank: true
  has_secure_password
end
