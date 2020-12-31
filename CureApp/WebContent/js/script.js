var myApp = angular.module("myModule",[]);

myApp.controller("myController", function($scope) {
	usertypeArr = ["Patient", "Doctor"],
	$scope.usertypeArr = usertypeArr;
});

myApp.controller("docSignup",function($scope) {
	$scope.Doctor = {
			specialization : ["Physician", "Pediatrician", "Gynecologist", "Psychiatrist", "Cardiologist", "Dermatologist", "Endocrinologist", "Gastroenterologist",
				"Nephrologist", "Ophthalmologist", "Otolaryngologist", "Pulmonologist", "Neurologist", "Radiologist", "Anesthesiologist", "Oncologist"],
			qualifications : ["MBBS", "BMBS", "MBChB", "MD", "Dr.MuD", "Dr.Med", "DO"]
	};
	$scope.passValidation = false;
	$scope.changepassword = function() {
		var regexp = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,20}$/;
		if(regexp.test($scope.pswd) == false)
		{
			$scope.passValidation = false;
		}
		else
		{
			$scope.passValidation = true;
		}
	};
});

myApp.controller("specialistList",function($scope) {
	$scope.specialization = ["Physician", "Pediatrician", "Gynecologist", "Psychiatrist", "Cardiologist", "Dermatologist", "Endocrinologist", "Gastroenterologist",
				"Nephrologist", "Ophthalmologist", "Otolaryngologist", "Pulmonologist", "Neurologist", "Radiologist", "Anesthesiologist", "Oncologist"]
});

myApp.controller("medicineController", function($scope) {
	
});

myApp.controller("chatController", function($scope) {
	
});

myApp.controller('FormController', function($scope) {
  $scope.userType = 'chemist';
  $scope.reset = function() {
	  $scope.userType = angular.copy('chemist');
	  $scope.username = angular.copy('');
	  $scope.password = angular.copy('');
  }
});

/*
myApp.controller('ViewPatientController', ['$scope',function($scope) {
    $scope.clicked = function(){   
        window.location = '#/prescription.jsp';
    }
}]);
*/

//Activating Owl Carousel for slider
$(function() {
    $("#slider-banners").owlCarousel({
        items: 1,
        autoplay: true,
        margin: 15,
        center: true,
        loop: true
    });
});
