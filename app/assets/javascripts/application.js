// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require select2
//= require foundation
//= require angular/angular
//= require angular-route/angular-route
//= require angular-resource
//= require angular-flash
//= require ng-file-upload
//= require ng-file-upload-shim
//= require angular-rails-templates
//= require_tree .

$(function(){
	 $(document).foundation(); 
	 
	 $( ".selectize, #tag_list" ).select2({tags:true, language: "es"});
	 $( ".mark, #user_barrio" ).select2({language: "es"});
	 
   $("#evento_espacio").each(function(index) {
     if($(this).is(":checked")){
       $("#necessities").show();
     }
   });
	 
	 
   $("#evento_espacio").on( "click", function() {

     if ($(this).is(":checked")) {
       console.log("check");
			 $("#necessities").show();
     }
     else if (!$(this).is(":checked")) {
       console.log($("#necessities"),"uncheck");
			 $("#necessities").hide();
     }
 	});
	 
});
