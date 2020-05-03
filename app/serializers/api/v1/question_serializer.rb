class Api::V1::QuestionSerializer
  include FastJsonapi::ObjectSerializer

  attributes :description, :keywords, :public
end
