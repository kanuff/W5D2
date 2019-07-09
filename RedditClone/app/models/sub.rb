# == Schema Information
#
# Table name: subs
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  title       :string           not null
#  description :text             not null
#  user_id     :integer          not null
#

class Sub < ApplicationRecord
  validates :title, :description, :user_id, presence: true
  belongs_to :moderator, 
    foreign_key: :user_id, 
    class_name: :User

    has_many :post_subs, 
      foreign_key: :sub_id, 
      class_name: :PostSub 
    
   has_many :posts, 
    through: :post_subs, 
    source: :post


end 


