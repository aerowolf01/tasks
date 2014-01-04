require 'spec_helper'

describe "Tasks" do
  describe "GET /tasks" do
    it 'display some tasks' do
      visit tasks_path
      page.should have_content "continue building this app"
    end
  end
end
