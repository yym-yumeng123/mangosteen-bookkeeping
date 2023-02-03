class Api::V1::ItemsController < ApplicationController
  def index
    current_user_id = request.env["current_user_id"]
    return head :unauthorized if current_user_id.nil?
    items = Item.where({ user_id: current_user_id })
      # .where({ created_at: params[:created_after]..params[:created_before] })
      .where({ happend_at: params[:happend_after]..params[:happend_before] })
    items = items.where(kind: params[:kind]) unless params[:kind].blank?
    items = items.page(params[:page])

    initValue = { expenses: 0, income: 0 }
    summary = items.inject (initValue) { |result, item|
      result[item.kind.to_sym] += item.amount
      result
    }
    summary[:balance] = summary[:income] - summary[:expenses]

    render json: { resources: items, summary: summary, pager: {
      page: params[:page] || 1,
      per_page: Item.default_per_page,
      count: Item.count,
    } }
  end

  def create
    item = Item.new params.permit(:amount, :happend_at, :kind, tag_ids: [])
    item.user_id = request.env["current_user_id"]
    if item.save
      render json: { resource: item }
    else
      render json: { errors: item.errors }, status: :unprocessable_entity
    end
  end

  def balance
    current_user_id = request.env["current_user_id"]
    return head :unauthorized if current_user_id.nil?
    items = Item.where({ user_id: current_user_id })
      .where({ happen_at: params[:happen_after]..params[:happen_before] })
    income_items = []
    expenses_items = []
    items.each {|item|
      if item.kind === 'income'
        income_items << item
      else
        expenses_items << item
      end
    }
    income = income_items.sum(&:amount)
    expenses = expenses_items.sum(&:amount)
    render json: { income: income, expenses: expenses, balance: income - expenses }
  end


  def summary
    hash = Hash.new
    items = Item
      .where(user_id: request.env["current_user_id"])
      .where(kind: params[:kind])
      .where(happend_at: params[:happened_after]..params[:happened_before])
    items.each do |item|
      if params[:group_by] == "happend_at"
        key = item.happend_at.in_time_zone("Beijing").strftime("%F")
        hash[key] ||= 0
        hash[key] += item.amount
      else
        item.tag_ids.each do |tag_id|
          key = tag_id
          hash[key] ||= 0
          hash[key] += item.amount
        end
      end
    end
    groups = hash
      .map { |key, value| { "#{params[:group_by]}": key, amount: value } }
    if params[:group_by] == "happend_at"
      groups.sort! { |a, b| a[:happend_at] <=> b[:happend_at] }
    elsif params[:group_by] == "tag_id"
      groups.sort! { |a, b| b[:amount] <=> a[:amount] }
    end
    render json: {
      groups: groups,
      total: items.sum(:amount),
    }
  end
end
