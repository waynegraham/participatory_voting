# frozen_string_literal: true

# @see https://github.com/teamcapybara/capybara#using-capybara-with-rspec

describe 'the voting process', type: :feature do
  before :each do
    @proposal = create(:proposal)
  end

  it 'displays a sign in button' do
    visit '/proposals'
    expect(page).to have_content('Sign In to Vote')
  end

  it 'signs in' do
    user = create(:user)

    visit '/users/sign_in'
    within('#new_user') do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
    end
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end

  it 'has a Cast Vote button after login' do
    login_as(build(:user))
    visit '/proposals'
    expect(page).to have_content('Cast Vote')
  end

  describe 'The AJAX voting system', js: true do

    before :each do
      user = build(:user)
      login_as(user)
    end

    # it 'can cast a vote' do
    #   visit '/proposals'
    #
    #   # click_link('Cast Vote', wait: 5)
    #   #find('Cast Vote', wait: 5).click
    #   puts find('#like_1').inspect
    #   #find_link(id: 'like_1').trigger(:click)
    #   sleep(60)
    #   expect(page).to have_content('Undo Vote')
    #
    #   # save_and_open_page
    # end

    # it 'increments the vote count' do
    #   visit '/'
    #   click_link('Cast Vote', wait: 5)
    #   expect(page).to have_content('1 Like')
    # end
    #
    # it 'decriments the vote count' do
    #   visit '/'
    #   click_link('Cast Vote', wait: 5)
    #   click_link('Undo Vote', wait: 5)
    #   expect(page).to have_content('0 Likes')
    # end
    #
    # it 'can undo a vote' do
    #   visit '/'
    #   click_link('Cast Vote', wait: 5) # cast a vote
    #   click_link('Undo Vote', wait: 5)
    #   expect(page).to have_content('Cast Vote')
    # end
  end
end
