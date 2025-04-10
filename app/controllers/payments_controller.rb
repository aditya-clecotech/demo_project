class PaymentsController < ApplicationController
  def new 
  end

  def create
    plan = params[:plan]
    plans = {
      "basic" => { price: "price_1RBsWV13kpId3pWt4dFlHtA2", posts_allowed: 5 },
      "standard" => { price: "price_1RBsWu13kpId3pWttjrn5jk6", posts_allowed: 12 },
      "premium" => { price: "price_1RBsXF13kpId3pWtPEUYSLY4", posts_allowed: nil } # nil = no limit user can see all posts
    }

    customer = Stripe::Customer.create(
        name: current_user.name,
        email: current_user.email,
        description: "Customer id: #{current_user.id}",
    )

    session = Stripe::Checkout::Session.create(
      customer: customer,
      payment_method_types: ['card'],
      line_items: [{
        price: plans[plan][:price],
        quantity: 1
      }],
      mode: 'subscription',
      success_url: payments_success_url(plan: plan),
      cancel_url: payments_cancel_url
    )

    redirect_to session.url, allow_other_host: true
  end

  def success
    plan = params[:plan]
    post_limits = { "basic" => 5, "standard" => 12, "premium" => nil }
    posts_allowed = post_limits[plan]

    current_user.create_subscription!(
      posts_allowed: posts_allowed,
      stripe_price_id: plan,
      active: true
    )

    redirect_to root_path, notice: "Subscription activated!"
  end

  def cancel
    redirect_to root_url, alert: "Purchase Unsuccessful"
  end

end


# THIS ACTION(LOGIC) IS FOR PAYMENT NOT FOR SUBSCRIPTION

# def create 
#    #create stripe customer for payment, update if already created
#    customer = Stripe::Customer.create(
#          name: current_user.name,
#          email: current_user.email,
#       description: "Customer id: #{current_user.id}",
#    )

#    session = Stripe::Checkout::Session.create( 
#       customer: customer, 
#       payment_method_types: ['card'],
#       line_items: [{
#          price: 'price_1RBZxM13kpId3pWttq4DG29r',
#          quantity: 1,
#          }],
#          mode: 'payment',
#          success_url:  payments_success_url,
#          cancel_url: payments_cancel_url
#       )
#       redirect_to session.url, allow_other_host: true
#    end
# end      
      
# def success
#    #handle successful payments
#    redirect_to root_url, notice: "Purchase Successful"
# end
