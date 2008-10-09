# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class IphoneExtension < Radiant::Extension
  version "0.0.1"
  description "This extension adds an iphone tailored ui to Radiant CMS."
  url "http://gravityblast.com"
  
  define_routes do |map|
    map.namespace :iadmin do |iadmin|
      iadmin.login     '/',           :controller => 'dashboard', :action => 'login'
      iadmin.logout    '/logout',     :controller => 'dashboard', :action => 'logout'
      iadmin.dashboard '/dashboard',  :controller => 'dashboard', :action => 'index'
      map.with_options(:controller => 'iadmin/pages') do |page|
        page.iadmin_page_index         'iadmin/pages',                        :action => 'index'
        page.iadmin_page               'iadmin/pages/:id',                    :action => 'show'
        page.iadmin_page_edit          'iadmin/pages/edit/:id',               :action => 'edit'
      end      
    end
  end
  
  def activate
    # admin.tabs.add "Iphone", "/admin/iphone", :after => "Layouts", :visibility => [:all]
  end
  
  def deactivate
    # admin.tabs.remove "Iphone"
  end
  
end