class Micropost < ActiveRecord::Base
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  
  belongs_to :user
  
  has_many :frelationships, class_name: "Frelationship",
                            foreign_key: "fmicropost_id",
                            dependent: :destroy
  has_many :frelationships_fusers, through: :frelationships, source: :fuser    
  
  # 他のユーザーのコメントをお気に入りにする
  #def favorite(other_micropost)
    #frelationships.create(fmicropost_id: other_micropost.id)
  #end

  # お気に入りにしているコメントを解除する
  #def unfavorite(other_user)
    #frelationships.find_by(fmicropost_id: other_micropost.id).destroy
  #end

  # あるユーザーのコメントをお気に入りにしているかどうか？
   def favorited?(user)
      frelationships_fusers.include?(user) 
   end
end
