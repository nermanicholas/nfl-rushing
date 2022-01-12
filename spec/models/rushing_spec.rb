require "rails_helper"

RSpec.describe Rushing, type: :model do
  it "contains the expected sortable columns" do
    expect(Rushing::SORTABLE_COLUMNS).to contain_exactly(:yards, :longest, :touchdowns)
  end
end