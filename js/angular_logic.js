/* �������������� ���������� Angular, ���������� ����������� ngSanitize � vcRecaptcha */
var blog_app = angular.module('blog_app', ['ngSanitize', 'vcRecaptcha']);


/* ����������, ���������� �� ��������� ������� �� �������� � �������� */
blog_app.controller('postController', ['$scope', '$sce', '$window', 'comments', 'posts', 'vcRecaptchaService', function ($scope, $sce, $window, comments, posts, vcRecaptchaService) {

    /* ������������� */
    $scope.post_id = '1';
    $scope.parent_id = 0;

    /* ������� ��������� ����������� ������� */
    $scope.get_post = function() {
        posts.getPost($scope.post_id).success(function(data){
            console.log(data);
            $scope.post = data[0];
            console.log ($scope.post);
            $window.scrollTo(0, 0);
        }).error(function(){
            console.log('Error');
        });
    }

    /* ������� ��������� ������ ������������ */
    $scope.get_comments = function() {
        comments.getComments($scope.post_id).success(function(data){
            console.log(data);
            if (data != 'null'){$scope.comments = data} else {$scope.comments = {}}
            console.log(data);
        }).error(function(){
            console.log('Error');
        });
    }

    /* ������� ���������� ������������ */
    $scope.post_comment = function() {
        comments.comment_publish($scope.create_comment_value, $scope.action_type, $scope.post_id, $scope.user_name, $scope.user_email, $scope.parent_id, $scope.recaptcha).success(function(){
            $scope.new_comment = '';
            $scope.get_comments();
        }).error(function(){
            console.log('Error');
        })
    }

    /* ������� �������� ���������� ���� ��� ���������� ����������� */
    $scope.show_comment_popup = function (id) {
        vcRecaptchaService.reload();
        $scope.create_comment_value = '';
        if (id == 'new') {
            $scope.action_type = 'create';
            $scope.parent_id = 0;
        }
        else { $scope.action_type = 'reply'; $scope.parent_id = id }
    }

    /* ��������� ����������� ����������� */
    $scope.get_post();
    $scope.get_comments();

}]);

/* ������ ������������, �������� �� �������������� � ��������, ������� ������ � ������������� */
blog_app.service('comments', ['$http', function ($http) {

    /* ������� ��������� ������ ������������ */
    this.getComments = function (post) {
        return $http({
                url: 'api/comments.php',
                method: "GET",
                params: {type: 'read_list', post_id: post}
            }
        )
    }

    /* ������� ���������� ����������� */
    this.comment_publish = function (comment, type, post, user_name, user_email, parent_id, recaptcha) {
        return $http.post('api/comments.php', $.param({
            type: type,
            comment: comment,
            user_name: user_name,
            user_email: user_email,
            parent_id: parent_id,
            post_id: post,
            recaptcha: recaptcha,
        }), {
            headers: {'Content-Type': 'application/x-www-form-urlencoded;'}
        });
    }

}]);

/* ������ ������/��������, �������� �� �������������� � ��������, ������� ������ � �������/��������� */
blog_app.service('posts', ['$http', function ($http) {

    this.getPost = function (id) {
        return $http({
                url: 'api/posts.php',
                method: "GET",
                params: {type: 'read_one', id: id}
            }
        )
    }

}]);
