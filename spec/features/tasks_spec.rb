require 'spec_helper'

describe "Tasks" do

  before do
    @task = Task.create :task => 'do some awesome rails stuff'
  end

  describe "GET /tasks" do
    it 'display some tasks' do
      visit tasks_path
      page.should have_content "do some awesome rails stuff"
    end

    it 'creates a new task' do
      visit tasks_path
      fill_in 'Task', :with => 'practice ruby-foo'
      click_button 'Create Task'

      current_path.should == tasks_path
      page.should have_content "practice ruby-foo"
    end

  describe "PUT /tasks" do
    it "edits a task" do
      visit tasks_path
      click_link 'Edit'

      current_path.should == edit_tasks_path(@task)

      page.should have_content 'do some awesome rails stuff'

      fill_in 'Task', :with => 'Updated task'
      click_button 'Update Task'

      page.should have_content 'Updated task'
    end
  end
  end
end
