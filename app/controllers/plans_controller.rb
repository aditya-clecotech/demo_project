class PlansController < ApplicationController
   def new
   end

   def create 

      product = Stripe::Product.create({
         name: params[:plan][:name]
      })

      price = Stripe::Price.create({
         currency: 'inr',
         unit_amount: params[:plan][:price_in_rupees].to_i*100,
         recurring: {interval: 'month'},
         product: product.id 
      })

      Plan.create!(
         name: product.name,
         stripe_product_id: product.id,
         stripe_price_id: price.id,
         posts_allowed: params[:plan][:posts_allowed],
         price_in_rupees: params[:plan][:price_in_rupees]
      )
      redirect_to root_path, notice: "Plan was created successfully..."
   end
end
