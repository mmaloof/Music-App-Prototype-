/* global angular */
(function() {
  angular.module('app').controller('chatCtrl', function($scope, $http) {
    $scope.setup = function() {
      $http.get('/api/v1/users.json').then(function(response) {
        console.log(response);
      });
    };
  });
})();