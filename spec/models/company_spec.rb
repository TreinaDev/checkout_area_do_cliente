require 'rails_helper'

RSpec.describe Company, type: :model do
  subject { create :company }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
end
