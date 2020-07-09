require 'rails_helper'

RSpec.describe RejectedOrder, type: :model do
  subject { create :rejected_order }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
end
