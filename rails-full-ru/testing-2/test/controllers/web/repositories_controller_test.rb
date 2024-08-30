# frozen_string_literal: true

require 'test_helper'

class Web::RepositoriesControllerTest < ActionDispatch::IntegrationTest
  test 'should create repo' do
    stub_url = 'https://api.github.com/repos/isas2/hexlet-assignments'
    repo_url = 'https://github.com/isas2/hexlet-assignments'
    stub_request(:get, stub_url).
      to_return(status: 200,
                body: JSON.parse(load_fixture('files/response.json')).to_json,
                headers: { 'Content-Type' => 'application/json' })

    assert_difference('Repository.count') do
      post repositories_url, params: { repository: { link: repo_url } }
    end

    repository = Repository.last
    assert_equal repository.repo_name, 'Hello-World'
  end
end
