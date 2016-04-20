class StaysController < ApplicationController
  before_action :check_logged_in
  before_action :set_stay, only: [:show, :edit, :update, :destroy]
  
  def index
    @stays = Stay.all
  end
  
  def show
  end
  
  def new
  end
  
  def edit
  end
  
  def update
    if @stay.update(stay_params)
      flash[:info] = "Obecność zapisana"
      redirect_to stays_url
    else
      render :edit
    end
  end
  
  def destroy
    @stay.destroy
    flash[:info] = "Obecność usunięta"
    redirect_to stays_url
  end
  
  def register
    @children = Child.all
  end
  
  def start
    @child = Child.find(params[:id])
    if not @child.stays.empty? and @child.stays.last.end.nil?
      flash[:danger] = "Błąd! To nie powinno się zdarzyć :("
      redirect_to stays_url
    end
    
    @stay = Stay.new(child: @child, start: DateTime.now)
    if @stay.save
      flash[:info] = "Zarejestrowano początek pobytu dziecka."
      redirect_to stays_url
    else
      render :register
    end
  end
  
  def stop
    @child = Child.find(params[:id])
    if @child.stays.empty? or not @child.stays.last.end.nil?
      flash[:danger] = "Błąd! To nie powinno się zdarzyć :("
      redirect_to stays_url
    end
    
    @stay = @child.stays.last
    @stay.end = DateTime.now
    if @stay.save
      flash[:info] = "Zarejestrowano koniec pobytu dziecka."
      redirect_to stays_url
    else
      render :register
    end
  end
  
  private
    def set_stay
      @stay = Stay.find(params[:id])
    end

    def stay_params
      params.require(:stay).permit(:start, :end)
    end
end
