class PaymentsController < ApplicationController
   def new 
   end

   def create 
      #create stripe customer for payment, update if already created
      customer = Stripe::Customer.create(
         name: current_user.name,
         email: current_user.email,
         description: "Customer id: #{current_user.id}",
      )
  
      session = Stripe::Checkout::Session.create( 
         customer: customer, 
         payment_method_types: ['card'],
         line_items: [{
         price: 'price_1RBZxM13kpId3pWttq4DG29r',
         quantity: 1,
         }],
         mode: 'payment',
         success_url:  payments_success_url,
         cancel_url: payments_cancel_url
      )
      redirect_to session.url, allow_other_host: true
   end

   def success
      #handle successful payments
      redirect_to root_url, notice: "Purchase Successful"
   end
   
   def cancel
      #handle if the payment is cancelled
      redirect_to root_url, notice: "Purchase Unsuccessful"
   end
end
