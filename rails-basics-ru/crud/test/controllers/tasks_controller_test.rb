require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @attrs = {
      name: Faker::Lorem.sentence.chomp('.'),
      description: Faker::Lorem.paragraphs.join("\n\n"),
      status: Faker::Subscription.status,
      creator: Faker::Name.unique.name,
      performer: Faker::Name.unique.name,
      completed: Faker::Boolean.boolean(true_ratio: 0.85)
    }
  end

  test 'should get index' do
    get tasks_path
    assert_response :success
  end

  test 'should get show' do
    task = Task.first
    get task_path(task.id)
    assert_response :success
  end

  test 'should create new task' do
    post tasks_url, params: { task: @attrs }

    task = Task.find_by! name: @attrs[:name]

    assert_redirected_to task_url(task)
  end

  test 'should update task' do
    task = Task.first
    patch task_url(task), params: { task: @attrs }
    assert_redirected_to task_url(task)

    task.reload

    assert { task.name == @attrs[:name] }
  end

  test 'should destroy task' do
    task = Task.first
    delete task_url(task)

    assert_redirected_to tasks_url

    assert { !Task.exists? task.id }
  end
end
