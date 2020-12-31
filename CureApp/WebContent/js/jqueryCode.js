$(function(){
	if($('div').hasClass('create')){
		$.alert({
			icon: 'fas fa-check-circle',
		    title: 'Signup Successful',
		    content: 'Congratulations!',
		    type: 'green',
		    backgroundDismiss: false,
		    backgroundDismissAnimation: 'shake',
		    buttons: {
		    	contBtn1 : {
		    		text: 'CONTINUE',
		    		action: function(){
						$(location).attr('href','http://localhost:8080/CureApp/Login.jsp');
					}
		    	}
		    }
		});
	}
	else if($('div').hasClass('noCreate'))
	{
		$.alert({
			icon: 'fas fa-exclamation-circle',
		    title: 'Signup Unsuccessful',
		    content: 'Try again later.... Change username',
		    type: 'red',
		    backgroundDismiss: false,
		    backgroundDismissAnimation: 'shake',
		    buttons: {
		    	tryAgain : {
		    		text: 'TRY AGAIN',
		    		action: function(){
						$(location).attr('href','http://localhost:8080/CureApp/signup.jsp');
					}
		    	}
		    }
		});
	}
});

$(function(){
	if($('div').hasClass('valid')){
		$.alert({
			icon: 'fas fa-exclamation-triangle',
			title: 'Oops!! Authentication Error',
			content: 'Please try login again.',
			type: 'orange',
			draggable: false,
			backgroundDismiss: false,
		    backgroundDismissAnimation: 'shake',
			buttons: {
				continueBtn: {
					text: 'Continue',
					action: function(){
						$(location).attr('href','http://localhost:8080/CureApp/logout.jsp');
					}
				}
			}
		});
	}
});

$(function(){
	if($('div').hasClass('chemist')){
		$.alert({
			icon: 'fas fa-exclamation-triangle',
			title: 'Oops!! Authentication Error',
			content: 'Chemist Not Recognised.',
			type: 'dark',
			draggable: false,
			backgroundDismiss: false,
		    backgroundDismissAnimation: 'shake',
			buttons: {
				continueBtn: {
					text: 'Continue',
					action: function(){
						$(location).attr('href','http://localhost:8080/CureApp/chemistLogin.jsp');
					}
				}
			}
		});
	}
});

// Select Doctor
$(function(){
	if($('#success').length == 1) {
		$.alert({
			icon: 'fas fa-check-double',
			title: 'Successfull!!',
			content: 'Doctor Selected.',
			type: 'green',
			backgroundDismiss: false,
		    backgroundDismissAnimation: 'shake',
			buttons: {
				continueBtn: {
					text: 'Continue',
					action: function(){
						$(location).attr('href','http://localhost:8080/CureApp/waitAppointment.jsp');
					}
				}
			}
		});
	}
	else if($('#unsuccess').length == 1) {
		$.alert({
			icon: 'fas fa-radiation-alt',
			title: 'Task Failed Successfully!!',
			content: 'Doctor Unavailable!! Try another one.',
			type: 'red',
			backgroundDismiss: false,
		    backgroundDismissAnimation: 'shake',
			buttons: {
				continueBtn: {
					text: 'Continue',
					action: function(){
						$(location).attr('href','http://localhost:8080/CureApp/selectspecialist.jsp');
					}
				}
			}
		});
	}
});

// Add Medicine
$(function(){
	if($('div').hasClass('added')){
		$.alert({
			icon: 'fas fa-cart-plus',
		    title: 'Medicine Added Successfully',
		    content: 'Congratulations!',
		    type: 'green',
		    draggable: false,
		    backgroundDismiss: false,
		    backgroundDismissAnimation: 'shake',
		    buttons: {
		    	contBtn1 : {
		    		text: 'CONTINUE',
		    		action: function(){
						$(location).attr('href','http://localhost:8080/CureApp/index.jsp');
					}
		    	}
		    }
		});
	}
	else if($('div').hasClass('notadded'))
	{
		$.alert({
			icon: 'fas fa-bug',
		    title: 'Medicine Not Added',
		    content: 'Try again later... Some Error Occured!',
		    type: 'red',
		    draggable: false,
		    backgroundDismiss: false,
		    backgroundDismissAnimation: 'shake',
		    buttons: {
		    	tryAgain : {
		    		text: 'TRY AGAIN',
		    		action: function(){
						$(location).attr('href','http://localhost:8080/CureApp/AddMedicine.jsp');
					}
		    	}
		    }
		});
	}
});

//Update Medicine
$(function(){
	if($('div').hasClass('updatedMedicine'))
	{
		$.alert({
			icon: 'fas fa-edit',
		    title: 'Updated Successfully',
		    content: 'Press Continue to update more.',
		    type: 'green',
		    draggable: false,
		    backgroundDismiss: false,
		    backgroundDismissAnimation: 'shake',
		    buttons: {
		    	contBtn1 : {
		    		text: 'CONTINUE',
		    		action: function(){
						$(location).attr('href','http://localhost:8080/CureApp/ViewMedicine.jsp');
					}
		    	}
		    }
		});
	}
	else if($('div').hasClass('notUpdatedMedicine')) {
		//Update Medicine Failed
		$.alert({
			icon: 'fas fa-ban',
		    title: 'Update Failed',
		    content: 'Press continue to try again.',
		    type: 'red',
		    draggable: false,
		    backgroundDismiss: false,
		    backgroundDismissAnimation: 'shake',
		    buttons: {
		    	contBtn1 : {
		    		text: 'CONTINUE',
		    		action: function(){
						$(location).attr('href','http://localhost:8080/CureApp/ViewMedicine.jsp');
					}
		    	}
		    }
		});
	}
});

//Update Doctor
$(function(){
	if($('div').hasClass('updatedDoctor'))
	{
		$.alert({
			icon: 'fas fa-smile',
		    title: 'Updated Successfully',
		    content: 'Press Continue.',
		    type: 'green',
		    draggable: false,
		    backgroundDismiss: false,
		    backgroundDismissAnimation: 'shake',
		    buttons: {
		    	contBtn1 : {
		    		text: 'CONTINUE',
		    		action: function(){
						$(location).attr('href','http://localhost:8080/CureApp/index.jsp');
					}
		    	}
		    }
		});
	}
	else if($('div').hasClass('updatedDoctorFailed')) {
		//Update Doctor Failed
		$.alert({
			icon: 'fas fa-frown',
		    title: 'Update Failed',
		    content: 'Press continue to try again.',
		    type: 'red',
		    draggable: false,
		    backgroundDismiss: false,
		    backgroundDismissAnimation: 'shake',
		    buttons: {
		    	contBtn1 : {
		    		text: 'CONTINUE',
		    		action: function(){
						$(location).attr('href','http://localhost:8080/CureApp/updatedoctor.jsp');
					}
		    	}
		    }
		});
	}
});

//Add Prescription
$(function(){
	if($('div').hasClass('prescribed')){
		$.alert({
			icon: 'fas fa-edit',
		    title: 'Medicine Added Successfully',
		    content: 'Congratulations!',
		    type: 'green',
		    draggable: false,
		    backgroundDismiss: false,
		    backgroundDismissAnimation: 'shake',
		    buttons: {
		    	contBtn1 : {
		    		text: 'CONTINUE',
		    		action: function(){
						$(location).attr('href','http://localhost:8080/CureApp/prescription.jsp');
					}
		    	}
		    }
		});
	}
	else if($('div').hasClass('notprescribed'))
	{
		$.alert({
			icon: 'fas fa-bug',
		    title: 'Medicine Not Added',
		    content: 'Try again later... Some Error Occured!',
		    type: 'red',
		    draggable: false,
		    backgroundDismiss: false,
		    backgroundDismissAnimation: 'shake',
		    buttons: {
		    	tryAgain : {
		    		text: 'TRY AGAIN',
		    		action: function(){
						$(location).attr('href','http://localhost:8080/CureApp/prescription.jsp');
					}
		    	}
		    }
		});
	}
});

$(document).ready(function() {
    $('#dtExample').DataTable({
    	"ordering": false
    });
    
      $('#dtExample_wrapper').find('select').each(function () {
    	    const $this = $(this);
    	    $this.css("border-top","0");
    	    $this.css("border-right","0");
    	    $this.css("border-left","0");
    	    $this.css("margin-bottom","8px");
    	  });
      $('#dtExample_wrapper .dataTables_filter').find('input').each(function () {
        const $this = $(this);
        $this.attr("placeholder", "Search");
        $this.removeClass('form-control-sm');
        $this.css("border-top","0");
        $this.css("border-right","0");
        $this.css("border-left","0");
        $this.css({"cursor":"text"});
      });
      $('#dtExample_wrapper .dataTables_filter').find('input').focus(function () {
    	  const $this = $(this);
    	  $this.css("outline","none");
      });
});

//Material Design example
$(document).ready(function () {
  $('#dtMaterialDesignExample').DataTable();

  $('#dtMaterialDesignExample_wrapper').find('label').each(function () {
    $(this).parent().append($(this).children());
  });
  $('#dtMaterialDesignExample_wrapper').find('select').each(function () {
	    const $this = $(this);
	    $this.css("border-top","0");
	    $this.css("border-right","0");
	    $this.css("border-left","0");
	    $this.css("margin-bottom","8px");
	  });
  $('#dtMaterialDesignExample_wrapper .dataTables_filter').find('input').each(function () {
    const $this = $(this);
    $this.attr("placeholder", "Search");
    $this.removeClass('form-control-sm');
    $this.css("border-top","0");
    $this.css("border-right","0");
    $this.css("border-left","0");
    $this.css({"cursor":"text"});
  });
  $('#dtMaterialDesignExample_wrapper .dataTables_filter').find('input').focus(function () {
	  const $this = $(this);
	  $this.css("outline","none");
  });
  $('#dtMaterialDesignExample_wrapper .dataTables_length').addClass('d-flex flex-row');
  $('#dtMaterialDesignExample_wrapper .dataTables_filter').addClass('md-form');
  $('#dtMaterialDesignExample_wrapper select').removeClass(
  'custom-select custom-select-sm form-control form-control-sm');
  $('#dtMaterialDesignExample_wrapper select').addClass('mdb-select');
  $('#dtMaterialDesignExample_wrapper .dataTables_filter').find('label').remove();
});

// Magnific Popup
$(function(){
	$(".img-wrapper").magnificPopup({
		delegate: 'a',   // child items selector by clicking on it popup will open
		type: 'image'
	    /* --other options
	    gallery: {
	        enabled: true
	    }	*/
	});
});

//Magnific Popup
$(function(){
	$(".img-gallery").magnificPopup({
		delegate: 'a',   // child items selector by clicking on it popup will open
		type: 'image',
	    // other options
	    gallery: {
	        enabled: true
	    }	
	});
});

// Popover plugin
$(document).ready(function(){
    $('[data-toggle="popover"]').popover();   
});

// Chat Panel
$(function() {
	$("#jumper").on("click", function(event) {
		var e = event || window.event;
		if(e.preventDefault) {
			e.preventDefault();
		}
		else {
			e.returnValue = true;
		}
		location.replace(this.href);
	});
});

// About us Slider
$(function() {
    $(".aboutus-carousel").owlCarousel({
        items: 1,
        autoplay: true,
        margin: 20,
        center: true,
        loop: true
    });
});