/**
 * Created by lizhiqiang on 2017/1/17.
 * Title: ClusterManager Controller
 */

angular.module('ClusterManager_App', ['ngStorage', 'ui.grid', 'GitUploader.GithubService', 'satellizer', 'ui.bootstrap'])
    .component("clusterManagerMain", {

        templateUrl: "/wp-content/pages/cluster/templates/ClusterManagerTemplate.html",
        controller: function ($scope, $http, $interval, $uibModal) {

        }
    })
    .controller("myController", function(){

    });