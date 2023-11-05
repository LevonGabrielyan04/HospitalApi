class CreateConsultationRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :consultation_requests do |t|
      t.string :patient
      t.text :request_text
      t.datetime :created_at_our

      t.timestamps
    end

    add_reference :recommendations, :consultation_request, foreign_key: true
  end
end