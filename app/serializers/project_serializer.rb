class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :picture, :date, :tags, :url
end
