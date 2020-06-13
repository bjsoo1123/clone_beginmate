ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :profile, :status
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :profile, :status]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
  	selectable_column
    id_column
    column :profile do |user|
      if user.profile.attached?
        image_tag url_for(user.profile), class: "small_image"
      end
    end
    column :name
    column :email
    column :status

    actions
  end

  scope :all, default: true

  # enum을 사용하면 scope 처리가 가능하다.
  scope :no_status
  scope :job_searching
  scope :job_offering
  scope :in_office

  index do
  	selectable_column
    id_column
    column :profile do |user|
      if user.profile.attached?
        image_tag url_for(user.profile), class: "small_image"
      end
    end
    column :name
    column :email
    column :status

    actions
  end

  filter :name
  filter :email

  show do
    ## 태이블 형태로 출력
    attributes_table do
      row :id
      row :profile do |user|
        if user.profile.attached?
          image_tag url_for(user.profile), class: "small_image"
        end
      end
      row :name
      row :email
  		row :status
    end
  end

end
