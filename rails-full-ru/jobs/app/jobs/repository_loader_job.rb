# frozen_string_literal: true

class RepositoryLoaderJob < ApplicationJob
  queue_as :default

  def perform(repository)
    client = Octokit::Client.new
    octokit_repo = Octokit::Repository.from_url(repository.link)
    data = client.repository(octokit_repo)
    repo_attrs = {
      link: data[:html_url],
      owner_name: data[:owner][:login],
      repo_name: data[:name],
      description: data[:description],
      default_branch: data[:default_branch],
      watchers_count: data[:watchers],
      language: data[:language],
      repo_created_at: data[:created_at],
      repo_updated_at: data[:updated_at]
    }
    # repository = Repository.find_by(link: link)
    if repository.update(repo_attrs)
      repository.modify!
    else
      repository.fail!
    end
  rescue StandardError
    repository.fail!
  end
end
