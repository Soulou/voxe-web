class NewAdmin::CountriesController < AdminController
  def index
    @countries = Country.all.order_by name: :asc
  end

  def create
    @country = Country.create params[:country]
    flash[:notice] = @country.to_s + " has correctly been created" if @country
    respond_with @country, location: new_admin_countries_path
  end

  def destroy
    country = Country.find params[:id]
    country.destroy
    flash[:notice] = country.to_s + " has been destroyed !"
    respond_with country, location: new_admin_countries_path
  end

  def edit
    @country = Country.find params[:id]
  end

  def update
    @country = Country.find params[:id]
    old_name = @country.name
    @country.update_attributes(params[:country])
    flash[:notice] = old_name + " has been updated to " + @country.name
    respond_with @country, location: new_admin_countries_path
  end
end