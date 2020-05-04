class Api::V1::QuestionSerializer
  include FastJsonapi::ObjectSerializer

  attributes :description, :keywords, :public, :answer_xpath
end
