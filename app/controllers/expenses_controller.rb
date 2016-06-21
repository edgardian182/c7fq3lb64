class ExpensesController < ApplicationController
  # def index

  #   if params[:concept] != "" && params[:category_id] != ""
  #     # Este código hace una busqueda no exacta
  #     # En este caso se quiere busar dos condiciones
  #     @expenses = Expense.where("lower(concept) LIKE ? AND lower(category_id) LIKE ?", "%#{params[:concept]}%", params[:category_id])
  #   elsif params[:concept] != "" && params[:category_id] == ""
  #     @expenses = Expense.where("lower(concept) LIKE ?", "%#{params[:concept]}%")
  #   elsif params[:category_id] != "" && params[:concept] == ""
  #     @expenses = Expense.where("lower(category_id) LIKE ?", params[:category_id])
  #   else
  #     @expenses = Expense.order("date DESC")
  #   end

  # end


  # La diferencia entre este código y el anterior es que cada vez se van filtrando más los datos almacenados sobre la misma variable @expenses mientras que arriba se llama al MODEL en cada condición
  def index
    @expenses = Expense.order("date DESC").where(user: current_user)
    if params[:concept].present?
      @expenses = @expenses.where("concept LIKE ?", "%#{params[:concept]}%")
    end
    if params[:category_id].present?
      @expenses = @expenses.where("category_id = ?", params[:category_id])
    end
  end
end
