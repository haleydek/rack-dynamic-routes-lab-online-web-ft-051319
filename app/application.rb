class Application
  @@items = [Item.new("Mango", 0.99), Item.new("French Bread", 2.49)]
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.path.match(/items/)
      item_name = req.path.split('/items/').last
      item = @@items.select { |item| item.name == item_name }
      if item == nil
        resp.write "Route not found"
        resp.status = 400
      else
        resp.write "#{item.price}"
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    
    resp.finish
  end
  
end