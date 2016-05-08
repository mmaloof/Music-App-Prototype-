/* global angular, Firebase */
(function() {

  angular.module('app').controller('chatCtrl', function($scope, $timeout, $http) {
    $scope.test = "hello test";
    var myDataRef = new Firebase('https://radiant-heat-5322.firebaseio.com/');
    
    $scope.setup = function() {
      $http.get('/api/v1/chat.json').then(function(response) {
        var users = response.data;
        // console.log(users);
        for (var i = 0; i < users.length; i++) {
          var user = users[i];
          if (user.isCurrentUser === true) {
            console.log(user);
            $scope.username = user.first_name + " " + user.last_name;
          }
        }

        // $scope.username = angular.isObject(

        $scope.messages = [];
        myDataRef.on('child_added', function(snapshot) {
          $timeout(function() {
            $scope.messages.push(snapshot.val());
          });
        });
      });
    };

    $scope.createMessage = function(inputText) {
      myDataRef.push({name: $scope.username, text: inputText});
      $scope.newMessageText = '';
    };

    window.$scope = $scope;
  });
})();