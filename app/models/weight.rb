class Weight < ApplicationRecord
  belongs_to :user
  # 非公開の設定
  enum status:{nonreleased: 0, released: 1}
end
