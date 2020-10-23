# frozen_string_literal: true

class Repository < ApplicationRecord
  validates :owner_login, presence: true
  validates :name, presence: true
  validates :html_url,
    presence: true,
    format: { with: URI.regexp(%w(http https)), message: :not_an_url }
  validates :clone_url,
    presence: true,
    format: { with: URI.regexp(%w(http https)), message: :not_an_url }
  validates :clone_url, format: { with: /.*\.git\Z/, message: :not_a_git_clone_url }

  validate :full_name_uniqueness

  validates_lengths_from_database

  private

  def full_name_uniqueness
    return unless Repository.where(owner_login: owner_login, name: name).exists?

    errors.add(:name, :already_exists_for_owner)
  end
end
