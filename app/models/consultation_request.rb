class ConsultationRequest < ApplicationRecord
    has_many :recommendations, foreign_key: "consultation_request"
end
