# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  description :text             not null
#  image       :string           not null
#  sample_url  :string
#  source_url  :string
#  accepted    :boolean          default("f"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Project < ActiveRecord::Base
  has_many :project_taggings, dependent: :destroy
  has_many :project_tags, through: :project_taggings

  validates :title, presence: true

  mount_uploader :image, ProjectImageUploader
end
