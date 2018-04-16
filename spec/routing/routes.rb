# frozen_string_literal: true

require 'rails_helper'

describe 'Routes Spec', type: :routing do
  it 'routes to the list of proposals' do
    expect(get: 'proposals/index').to rout_to 'proposals#index'
  end

  it 'routes to the home page' do
    expect(get: 'pages/home').to rout_to 'pages#show'
  end
end
