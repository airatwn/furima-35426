class OrderShippingAddress < ApplicationRecord
    include ActiveModel::Model
    attr_accesor :portal_code, :prefecture, :address1, :address2, :building_name, :phone_number, :order, :user_id
    end
    # ここにバリデーションの処理を書く
  
    def save
      # 各テーブルにデータを保存する処理を書く
    end
  end
  end
end
