angular.module('ClusterManager_App', ['ngStorage', 'ui.bootstrap'])
    
    .component("clusterMain", {
        templateUrl: "/wp-content/pages/cluster/templates/index.html",
        controller: function ($scope, $http, $uibModal) {
            $scope.satus = "ok";
            $scope.nodelist = "";

            $scope.myTest = function () {
                alert($scope.satus);
            }

            $scope.getNodeList = function(){
                var url = "ajax/cluster?action=cluster_get_nodelist";
                $http.get(url).then(function (response) {
                    $scope.nodelist = response.data.nodelist;
                })
            }
            $scope.getNodeList();

            $scope.addNode = function(){
                $uibModal.open({
                    templateUrl: "/wp-content/pages/cluster/templates/addNode.html",
                    controller: "addNodeController",
                });
            }
        }

    })

    .controller('addNodeController', function ($scope, $uibModalInstance, $http) {
        $scope.cancel = function () {
            $uibModalInstance.dismiss('cancel');
        }
        $scope.newIP = "";
        $scope.progressText = "asd";
        $scope.test = function () {
            alert(123);
        }

        $scope.addNodeSubmit = function () {
            if ($scope.newIP == "") {
                alert("请输入新节点的IP地址！");
            }else{
                $http.put("/ajax/cluster?action=cluster_addNode", { text: $scope.newIP }).done(function (data) {
                    alert(data);
                })

                $http({
                    method: 'PUT',
                    url: uri,
                    data: {
                        'message': 'file upload',
                        'content': fileContent
                    }
                }).then(function (response) {
                    if (callback) {
                        callback(true);
                    }
                }).catch(function (response) {
                    if (callback) {
                        callback(false);
                    }
                });
            }
            
        }

        $
    })


