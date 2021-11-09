class Project < ApplicationRecord
    # Model attribute validations
    validates_presence_of :title, :description
end
