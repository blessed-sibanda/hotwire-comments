# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :bigint           not null
#
# Indexes
#
#  index_comments_on_project_id  (project_id)
#
# Foreign Keys
#
#  fk_rails_...  (project_id => projects.id)
#
class Comment < ApplicationRecord
  include ActionView::RecordIdentifier
  belongs_to :project

  after_create_commit {
    broadcast_prepend_to [project, :comments],
                         target: "#{dom_id(project)}_comments"
  }

  validates :body, presence: true
end
