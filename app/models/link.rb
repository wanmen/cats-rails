class Link < ActiveRecord::Base
  belongs_to :list
  belongs_to :linkable, :polymorphic => true
end
