function $(id) { return document.getElementById(id); }

var PagePart = {
  selectTab: function(page_id, part_index) {
    var tabs      = $('page-' + page_id + '-tabs').getElementsByTagName('a');
    var contents  = $('page-' + page_id +'-contents').getElementsByTagName('div');    
    for (var i = 0; i < contents.length; i++) {      
      var tab     = tabs[i];
      var content = contents[i];      
      tab.className = (tab.id == 'tab-part-' + part_index) ? 'selected' : '';
      content.style.display = (content.id == 'content-part-' + part_index) ? 'block' : 'none';      
    }    
  },
  
  add: function(page_id) {
    var name = $('new-part-name').value;
    if (name == '') return;
    var part_index = PagePart.incrementIndex();    
    PagePart.addTab(page_id, part_index, name);
    PagePart.addContent(page_id, part_index, name);
    PagePart.selectTab(page_id, part_index);
    $('addPartForm').removeAttribute("selected");
  },
  
  addTab: function(page_id, part_index, name) {
    var tab_container = $('page-' + page_id + '-tabs');
    var tab = document.createElement('a');
    tab.setAttribute('onclick', 'PagePart.selectTab(' + page_id + ', ' + part_index + ')');
    tab.id = 'tab-part-' + part_index;
    tab.href = "#";
    tab.rel = 'nofollow';
    tab.innerHTML = name;
    tab_container.appendChild(tab);
  },
  
  addContent: function(page_id, part_index, name) {
    var content_container = $('page-' + page_id + '-contents');
    var content = document.createElement('div');
    content.id = 'content-part-' + part_index;
    content.className = "row textarea";  
    content.style.display = 'none';
    content.innerHTML =  '<input type="hidden" name="part[' + part_index + '][name]" value="' + name +'" />';
    content.innerHTML += '<textarea name="part[' + part_index + '][content]"></textarea>';
    content_container.appendChild(content);
  },
  
  incrementIndex: function() {
    var part_index_element = $('part-index-field');
    var part_index = parseInt(part_index_element.value) + 1;
    part_index_element.value = part_index;
    return part_index;
  }
  
};