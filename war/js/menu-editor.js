
var menuEditorActions= function() {
	$('a#edit').on('click', function(){
		var menuLabel = $(this).parent('li').find('span:first');
		if($(this).text()=='Edit') {
			$(this).text('Save');
			menuLabel.html('<input type="text" value="'+menuLabel.text()+'">');
		} else if($(this).text()=='Save') {
			$(this).text('Edit');
			menuLabel.html('<a href="#" class="menu-label">'+menuLabel.find('input').val()+'</a>');
		}
		resetActions();
	});
	
	$('a#remove').on('click', function(){
		$(this).parent('li:first').remove();
		resetActions();
	});
	
	$('a#insert-before').on('click', function(){
		$(this).parent('li:first').before('<li><span><input type="text" value=""></span> <a href="#" id="edit" class="button">Save</a> <a href="#" id="remove" class="button">Remove</a> <a href="#" id="insert-before" class="button">Insert Before</a> <a href="#" id="insert-after" class="button">Insert After</a> <a href="#" id="create-child" class="button">Create Child</a></li>');
		resetActions();
	});
	
	$('a#insert-after').on('click', function(){
		$(this).parent('li:first').after('<li><span><input type="text" value=""></span> <a href="#" id="edit" class="button">Save</a> <a href="#" id="remove" class="button">Remove</a> <a href="#" id="insert-before" class="button">Insert Before</a> <a href="#" id="insert-after" class="button">Insert After</a> <a href="#" id="create-child" class="button">Create Child</a></li>');
		resetActions();
	});
	
	$('a#create-child').on('click', function(){
		$(this).parent('li:first').append('<ul><li><span><input type="text" value=""></span> <a href="#" id="edit" class="button">Save</a> <a href="#" id="remove" class="button">Remove</a> <a href="#" id="insert-before" class="button">Insert Before</a> <a href="#" id="insert-after" class="button">Insert After</a> <a href="#" id="create-child" class="button">Create Child</a></li></ul>');
		$(this).remove();
		resetActions();
	});
	
	$('#menu-editor li a.menu-label').on('click', function(){
		$(this.parentNode.parentNode).find('ul').slideToggle('slow');
	});
	
};

var resetActions=function(){
	$('#menu-editor *').unbind('click');
	menuEditorActions();
};

var menuChangeHandler=function(data, parent) {
	var current;
	if(data.name == 'ROOT') {
		$("#menu-editor").html("<ul class='menu-ul'></ul>");
		current=$("#menu-editor ul.menu-ul").first();
	} else {
		if(data.menu!=null && data.menu.length>0) {
			var tags='<li><span><a href="#" class="menu-label">'+data.name+'</a></span> <a href="#" id="edit" class="button">Edit</a> <a href="#" id="remove" class="button">Remove</a> <a href="#" id="insert-before" class="button">Insert Before</a> <a href="#" id="insert-after" class="button">Insert After</a> <a href="#" id="create-child" class="button">Create Child</a><ul id="'+data.id+'"></ul></li>';
			parent.append(tags);
			current=parent.find("li ul#"+data.id).first();
		} else {
			var tags='<li><span><a href="#" class="menu-label">'+data.name+'</a></span> <a href="#" id="edit" class="button">Edit</a> <a href="#" id="remove" class="button">Remove</a> <a href="#" id="insert-before" class="button">Insert Before</a> <a href="#" id="insert-after" class="button">Insert After</a> <a href="#" id="create-child" class="button">Create Child</a></li>';
			parent.append(tags);
		}
	}
	for(var i=0;data.menu!=null && i<data.menu.length;i++) {
		menuChangeHandler(data.menu[i], current);
	}
};

$(document).ready(function() {
	menuEditorActions();
	$('select#menu-list').attr('createNewHtml', $('#menu-editor').html());
	$('select#menu-list').on('change', function(){
		if(this.value=='create-new') {
			$('#menu-editor').html($(this).attr('createNewHtml'));
			resetActions();
		} else {
			$.ajax({
				type : "get",
				url : /*"/shopnowat" +*/"/store/"+this.value.substring(0, this.value.indexOf("."))+"/custom-menu.htm",
				cache : false,
				success : function(data) {
					menuChangeHandler(data.menu);
					resetActions();
				}
			});
		}
	});
	
	$('#submit').on('click', function(){
		var prepareRequest=function() {
			$('#request-container').html('');
			$('#menu-editor ul.menu-ul *').each(function(i, element){
				if($(element).is('li')) {
					var id;
					if($(element.parentNode).hasClass('menu-ul')) {
						id=$('#menu-editor ul.menu-ul>li[menuId]').length+1;
					} else {
						id=$(element.parentNode.parentNode).attr('menuId')+"-"+($(element.parentNode).find('>li[menuId]').length+1);
					}
					$('#request-container').append("<input type='hidden' name='"+id+"' value='"+$(element).find('span a:first').text()+"'>");
					$(this).attr('menuId', id);
					console.log(id+"     "+$(element).find('span a:first').text());
				}
			});
		};
		
		prepareRequest();
		// below line url shopnowat
		$.ajax({
		        url : '/store/'+$('select#menu-list:first').find('[value]').substring(0, this.value.indexOf("."))+'/custom-menu-editor-action.htm',
		        type: "POST",
		        data : $('#request-container').serializeArray(),
		        success:function(data, textStatus, jqXHR) 
		        {
		            alert('sucess');
		        },
		        error: function(jqXHR, textStatus, errorThrown) 
		        {
		            alert('failed');
		        }
		    });
		
	});
	
});



