class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  # フォローの取得
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # フォロワーの取得
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
   # （自分がフォローしている人）followedが集まった集合体をfollowing_userとして、followerからfollowedを取得する
  has_many :following_user, through: :follower, source: :followed
    # （自分をフォローしている人）followerが集まった集合体をfollower_userとして、followedからfollowerを取得する
  has_many :follower_user, through: :followed, source: :follower

  # ユーザーをフォローする
  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  # ユーザーをフォローする
  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  # ユーザーのフォローを外す
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  # フォローしていればtrueを返す
  def following?(user)
    following_user.include?(user)
  end

def self.search(search, word)
  if search == "forward_match"
                @user = User.where("name LIKE?", "#{word}%")
  elsif search == "background_match"
                @user = User.where("name LIKE?", "%#{word}")
  elsif search == "perfect_match"
                @user = User.where("#{word}")
  elsif search == "partial_match"
                @user = User.where("name LIKE?", "$#{word}%")
  else
                @user = User.all
  end
end



  attachment :profile_image

  validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 20 }
  validates :email, presence: true
  validates :introduction, length: { maximum: 50 }

end