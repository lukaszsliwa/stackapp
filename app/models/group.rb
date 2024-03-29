class Group < ActiveRecord::Base
  belongs_to :teacher, :class_name => 'User'
  validates :name, :presence => true
  validates :teacher, :presence => true

  has_many :posts, :dependent => :destroy, :as => :postable
  has_many :user_groups, :dependent => :destroy
  has_many :users, :through => :user_groups
  has_many :teams, :dependent => :destroy
  has_many :containers, :dependent => :destroy

  def to_param
    [id, name.parameterize].join('-')
  end
end
