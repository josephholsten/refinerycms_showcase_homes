::Refinery::Application.routes.draw do
  resources :showcase_homes, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :showcase_homes, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
