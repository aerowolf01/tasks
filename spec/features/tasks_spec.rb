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
  end

  describe "PUT /tasks" do
    it "edits a task" do
      visit tasks_path
      click_link 'Edit'

      current_path.should == edit_task_path(@task)

      find_field('Task').value.should == 'do some awesome rails stuff'

      fill_in 'Task', :with => 'Updated task'
      click_button 'Update Task'

      current_path.should == tasks_path
      page.should have_content 'Updated task'
    end

    it "doesn't update empty tasks" do
      visit tasks_path
      click_link 'Edit'
      fill_in 'Task', :with => ''
      click_button 'Update Task'

      current_path.should == edit_task_path(@task)
      find_field('Task').value.should == 'do some awesome rails stuff'
      page.should have_content 'There was a problem updating your content.'
    end
  end

  describe "DELETE /tasks" do
    it "deletes a task" do
      visit tasks_path
      find("#task_#{@task.id}").click_link 'Delete'
      page.should have_content "Page has been deleted!"
      page.should have_no_content 'do some awesome rails stuff'
    end
  end

end
