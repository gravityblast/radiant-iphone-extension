class Iadmin::PagesController < Admin::PageController
  layout nil
  
  model_class Page
    
  def index
    @page = Page.find_by_parent_id(nil, :include => :children)
  end
  
  def show
    @page = Page.find(params[:id], :include => :children)
    render :action => 'index'
  end
  
  def model_edit_url(params = {})
    iadmin_page_edit_url
  end
  
end
