Rails.application.routes.draw do
  # Página pública (landing visual con template)
  root to: "public_pages#home" # 👈 Este es el único root que debe quedar

  get "up" => "rails/health#show", as: :rails_health_check

  post "/contact_messages", to: "contact_messages#create", as: "contact_messages"

  scope "(:locale)", locale: /en|es/ do
    devise_for :users, path: "", path_names: { sign_in: "login", sign_out: "logout" }, skip: [ :registrations, :passwords ]

    # Ruta al dashboard privado
    get "dashboard", to: "dashboard#index"

    # Ruta pública del currículum profesional
    get "/cv", to: "public_pages#resume", as: "public_resume"

    # Recursos anidados del currículum
    resources :resumes do
      resources :experiences, only: [:new, :create, :edit, :update, :destroy, :show]
      resources :educations, except: [ :index, :show ]
      resources :skills, except: [ :index, :show ]
      resources :projects, only: [ :show ]
      resource :contact_info, except: [ :show ]
      resources :certifications
    end

    # Acciones adicionales (como descargar el CV)
    get "downloads" => "public_pages#download_resume", as: "download"
    post "send_email" => "public_pages#send_email", as: "send_email"
  end

  # Otros posibles endpoints (como PWA)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
end
