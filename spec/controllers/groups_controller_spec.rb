describe "Group new" do
  describe 'GET #new' do
    it "requires parameter" do
      get :new
      expect(response).to redirect_to new_group_path
    end
  end

  describe "POST #create" do
    it "requires group" do
      post :create, contact: FactoryGirl.attributes_for(:group)
      expect(response).to redirect_to group_path
    end
  end
end