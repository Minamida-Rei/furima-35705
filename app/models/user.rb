class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday
  end

  with_options presence: true, format: {with: /\A[ぁ-んァ-ン一-龥々ー]+\z/} do
    validates :last_name
    validates :first_name
  end

  with_options presence: true, format: {with: /\A[ァ-ンー]+\z/} do
    validates :first_name_kana
    validates :last_name_kana
  end

  validates :password, presence: true, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
  
  has_many :products
end
