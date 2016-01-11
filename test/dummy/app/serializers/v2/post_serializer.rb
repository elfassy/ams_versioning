class V2::PostSerializer < ActiveModel::Serializer
  attributes :name
  has_many :comments
end
