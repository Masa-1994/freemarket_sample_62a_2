class CreateSnsCredentials < ActiveRecord::Migration[5.0]
  def change
    create_table :sns_credentials do |t|
      t.string      :uid                         #外部のユーザーid
      t.string      :provider                    #プロバイダ
      t.references  :user,  foreign_key: true    #user_id

      t.timestamps
    end
  end
end
