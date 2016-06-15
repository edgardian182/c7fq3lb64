class ExpensesController < ApplicationController
  def index

    if params[:concept] != "" && params[:category_id] != ""
      # Este código hace una busqueda no exacta
      # En este caso se quiere busar dos condiciones
      @expenses = Expense.where("lower(concept) LIKE ? AND lower(category_id) LIKE ?", "%#{params[:concept]}%", params[:category_id])
    else
      @expenses = Expense.order("date DESC")
    end

  end
end
