class Application
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.path.match(/items/)
      item_name = req.path.split('/items/').last
      item = Item.all.find? { |item| item.name == item_name }
      
      if item == nil?
        #status code = 404
      else
        resp.write "#{item.price}"
      end
      
    else
      #status code = 404
    end
    
    resp.finish
  end
  
end