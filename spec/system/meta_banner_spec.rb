# frozen_string_literal: true

RSpec.describe "Meta Banner", type: :system do
  let!(:theme) { upload_theme_component }
  fab!(:user) { Fabricate(:user, trust_level: TrustLevel[3]) }

  it "displays meta banner on the homepage" do
    visit("/")

    expect(page).to have_css(".custom-banner-wrapper")
  end

  it "does not display banner on routes other than the homepage" do
    visit("/top")

    expect(page).not_to have_css(".custom-banner-wrapper")
  end

  it "does not display for high trust users" do
    sign_in(user)

    visit("/")

    expect(page).not_to have_css(".custom-banner-wrapper")
  end
end
