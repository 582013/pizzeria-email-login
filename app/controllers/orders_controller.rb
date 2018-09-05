class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # layout  :user_layout

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
    # render :layout => 'project' overwrite all layout
    # render :layout=> false no layout
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
 
    @order = Order.new(order_params)
    respond_to do |format|
      if @order.save
        unless params[:order][:list].nil?
          orderitem = JSON.parse(params[:order][:list])
          orderitem.each do |item|
            if !item["id"].nil? 
              # @orderitem = @order.order_items.create(pizza_id: item[:id], quantity: item[:quantity])
              @orderitem = @order.order_items.create(pizza_id: item["id"], quantity: item["quantity"] )
            end
          end
        end
        OrderMailer.order_confirmation(@order).deliver!
     
       # OrderMailer.with(order: @order).order_confirmation.deliver_now
       

        format.html { redirect_to @order, notice: 'Order was successfully created. An confirmation receipt has been sent to your email.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # protected

  # def user_layout
  #   if false
  #     "admin"
  #   else 
  #     "application"
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      # params.require(:order).permit!  # kills security 
      params.require(:order).permit(:name, :total, :payment, :email, {:list => [:price, :id, :name, :quantity]})
    end
end