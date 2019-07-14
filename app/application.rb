# frozen_string_literal: true

class Application
  def call(env)
    res = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_param = req.path.split('/items/').last
      if Item.all.find { |item| item.name == item_param } == nil
        res.write('Item not found')
        res.status = 400
      else
        res.write(Item.all.find { |item| item.name == item_param }.price)
      end
    else
      res.write('Route not found')
      res.status = 404
    end
    res.finish
  end
end
