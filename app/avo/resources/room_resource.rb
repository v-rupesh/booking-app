class RoomResource < Avo::BaseResource
  self.title = :name
  self.includes = []
  self.default_view_type = :grid
  self.search_query = -> do
    scope.ransack(id_eq: params[:q], name_cont: params[:q], m: "or").result(distinct: false)
  end  
  field :id, as: :id
  field :name, as: :text
  field :description, as: :textarea
  field :photo, as: :file, is_image: true
  field :location, as: :belongs_to
  field :bookings, as: :has_many

  grid do
    cover :photo, as: :file, is_image: true, link_to_resource: true
    title :name, as: :text, required: true, link_to_resource: true
    body :description, as: :text do |model|
      model.description.truncate 30
    end
  end
end
