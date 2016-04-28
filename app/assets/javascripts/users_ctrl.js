/* global angular */
(function() {
  angular.module('app').controller('usersCtrl', function($scope, $http) {
    $scope.setup = function() {
      $http.get('/api/v1/users.json').then(function(response) {
        console.log(response);
      });
    };
  });
})();