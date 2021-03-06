module FrameAdmin
  extend ActiveSupport::Concern

  # Show data indicate in list, edit, show, in view users
  included do
    rails_admin do
      navigation_label 'Menu'
      weight 3
      list do
        field :station_id do
          pretty_value do
            Station.find(bindings[:object].station_id).code
          end
        end
        field :raw
        field :source_ip
        field :timestamp
        field :processed
      end
      show do
        field :station_id do
          pretty_value do
            Station.find(bindings[:object].station_id).code
          end
        end
        field :raw
        field :source_ip
        field :timestamp
        field :processed
      end
    end
  end
end