# ActiveAdmin.register Plan do

#   # See permitted parameters documentation:
#   # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#   #
#   # Uncomment all parameters which should be permitted for assignment
#   #
#   permit_params :name, :posts_allowed, :price_in_rupees
#   #
#   # or
#   #
#   # permit_params do
#   #   permitted = [:name, :stripe_product_id, :stripe_price_id, :posts_allowed, :price_in_rupees]
#   #   permitted << :other if params[:action] == 'create' && current_user.admin?
#   #   permitted
#   # end
  
# end


ActiveAdmin.register Plan do
  permit_params :name, :posts_allowed, :price_in_rupees, :stripe_product_id, :stripe_price_id

  controller do
    def create
      # Step 1: Permit params
      plan_params = params.require(:plan).permit(:name, :posts_allowed, :price_in_rupees)

      # Step 2: Create product & price on Stripe
      product = Stripe::Product.create(name: plan_params[:name])
      price = Stripe::Price.create(
        currency: 'inr',
        unit_amount: plan_params[:price_in_rupees].to_i * 100,
        recurring: { interval: 'month' },
        product: product.id
      )

      # Step 3: Build plan locally with Stripe values added
      @plan = Plan.new(plan_params.merge(
        stripe_product_id: product.id,
        stripe_price_id: price.id
      ))

      # Step 4: Save and redirect
      if @plan.save
        redirect_to admin_plan_path(@plan), notice: "Plan created with Stripe successfully"
      else
        render :new, alert: "Failed to create plan"
      end
    end
  end
end
