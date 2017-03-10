angular.module('ClusterManager_App', ['ngStorage', 'ui.bootstrap'])
    
    .component("clusterMain", {
        templateUrl: "/wp-content/pages/cluster/templates/index.html",
        controller: function ($scope, $http, $uibModal) {
            $scope.satus = "ok";
            $scope.nodelist = new Array();

            $scope.myTest = function () {
                alert("asd");
            }

            $scope.getNodeList = function(){
                var url = "ajax/cluster?action=cluster_get_nodelist";
                $http.get(url).then(function (response) {
                    //$scope.nodelist =response.data;
                    alert(response.data.result[0].ip);
                    for (var i = 0; i < response.data.result.length; i++) {
                        $scope.nodelist.push(response.data.result[i]);
                    }
                })
            }
            //$scope.getNodeList();

            $scope.addNode = function(){
                $uibModal.open({
                    templateUrl: "/wp-content/pages/cluster/templates/addNode.html",
                    controller: "addNodeController",
                    resolve: {//这是一个入参,这个很重要,它可以把主控制器中的参数传到模态框控制器中
                        items: function () {//items是一个回调函数
                            $scope.getNodeList();//这个值会被模态框的控制器获取到
                        }
                    }
                });

                
            }

            $scope.getResInfo = function () {
                var url = "ajax/cluster?action=cluster_getres";
                $http.get(url).then(function (response) {
                    $scope.satus = response.data.info;
                })
            }
            //$scope.getResInfo();
            
            
            
        }

    })

    .controller('addNodeController', function ($scope, $uibModalInstance, $http) {
        $scope.cancel = function () {
            $uibModalInstance.dismiss('cancel');
        }
        $scope.newIP = "";
        $scope.progressText = "请输入新节点的IP地址";
        $scope.test = function () {
            alert(123);
        }

        $scope.addNodeSubmit = function () {
            if ($scope.newIP == "") {
                alert("IP地址不能为空！");
            }else{
                $http.put("/ajax/cluster?action=cluster_addnode", { text: $scope.newIP }).then(function (response) {
                    if (response) {
                        $scope.progressText = response.data.result;
                        if (response.data.result == "节点添加成功") {
                            $scope.cancel();
                        } 
                    }
                })
            }
            
        }

        
    })


