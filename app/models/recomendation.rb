class Recomendation < ApplicationRecord
     belongs_to :consultation_request, class_name: "ConsultationRequest"
end
