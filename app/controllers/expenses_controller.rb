class ExpensesController < ApplicationController
  def index

    if params[:concept] != ""
      # Este código hace una busqueda no exacta
      @expenses = Expense.where("lower(concept) LIKE ?", "%#{params[:concept]}%")
    else
      @expenses = Expense.order("date DESC")
    end

  end
end
