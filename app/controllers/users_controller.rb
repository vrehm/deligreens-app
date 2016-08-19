class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @current_order = Order.where(user_id: current_user, current_order: true)
    @pending_orders = Order.where(user_id: current_user, pending_order: true)
    @producers = User.where(producer: true)

  end

  def dashboard
    @farmer = User.find(params[:id])
    @user = User.find(params[:id])
    @products = Product.where(user_id: @farmer)
    @pending_order_farmers = []
    ## Trouver les pendings orders :
    pending_orders = Order.where(pending_order: true)
    ## Regarder dans ces pendings les orders items
    pending_orders.each do |orders_items|
    ## Regarder dans ces pendings les produit
      orders_items.products.each do |product_from_order|
        ## [product1, product 2]
        if product_from_order.user == @farmer
          product_from_order.order_items.each do |order_item|
            @pending_order_farmers << order_item.order unless @pending_order_farmers.include?(order_item.order)
          end
        end
      end
    end

      ### That is for validating!
      # @validate_order_farmers = []
      # ## Trouver les validates orders :
      # validate_orders = Order.where(current_order: true)
      # ## Regarder dans ces validates les orders items
      # validate_orders.each do |orders_items|
      # ## Regarder dans ces validates les produit
      #   orders_items.products.each do |product_from_order|
      #     ## [product1, product 2]
      #     if product_from_order.user == @farmer
      #       product_from_order.order_items.each do |order_item|
      #         @validate_order_farmers << order_item.order unless @validate_order_farmers.include?(order_item.order)
      #       end
      #     end
        # end
  # end
    # Order = [Order de quoi] De tout les produits qu'à le fermier.
    # products.each.order_items.each.order
    # @product.order_items.order.orders_items.products.all
end
end
