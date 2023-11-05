class CreateRecomendations < ActiveRecord::Migration[7.1]
  def change
    create_table :recomendations do |t|
      t.string :consultation_request
      t.text :recommendation_text

      t.timestamps
    end
  end
end
