angular.module('ClusterManager_App', ['ngStorage', 'ui.bootstrap'])
    
    .component("clusterMain", {
        templateUrl: "/wp-content/pages/cluster/templates/index.html",
        controller: function ($scope, $http, $uibModal) {
            $scope.satus = "节点";
            $scope.info = "";
            $scope.nodelist = new Array();

            $scope.myTest = function (e) {
                //alert("asd");
                //if(!e){
                //    var e = window.event;
                //}  
                //var target = e.target;
                //$scope.satus = target.innerHTML;
                //$scope.getResInfo();
            }

            $scope.getNodeList = function(){
                var url = "ajax/cluster?action=cluster_get_nodelist";
                $http.get(url).then(function (response) {

                    $scope.nodelist.splice(0, $scope.nodelist.length);
                    for (var i = 0; i < response.data.result.length; i++) {
                        $scope.nodelist.push(response.data.result[i]);
                    }
                })
            }
            $scope.getNodeList();

            $scope.addNode = function(){
                var modalInstance = $uibModal.open({
                    templateUrl: "/wp-content/pages/cluster/templates/addNode.html",
                    controller: "addNodeController",
                   
                });

            }

            $scope.getResInfo = function (e) {
                if (!e) {
                    var e = window.event;
                }
                var target = e.target;
                $scope.satus = target.innerHTML;
                var url = "ajax/cluster?action=cluster_getres";
                $http.get(url).then(function (response) {
                    $scope.info = response.data.info;
                })

            }
            //$scope.getResInfo();
            
            $scope.remoteHostIP = "127.0.0.1";
            $scope.remoteProcessResult = "...";
            $scope.cmdScript = "dir";
            $scope.startRemoteProcess = function () {
                //var url = "ajax/cluster?action=cluster_start_process";
                //$http.get(url).then(function (response) {
                //    $scope.remoteProcessResult = response.data.result;
                //})

                $http.put("ajax/cluster?action=cluster_cmd", { cmd: $scope.cmdScript }).then(function (response) {
                    $scope.remoteProcessResult = response.data.result;
                })
            }

            $scope.remoteServerIP = "127.0.0.1";
            $scope.remoteServerPort = "8099";
            $scope.remoteServerResult = "...";
            $scope.startRemoteServer = function () {
                var url = "ajax/cluster?action=cluster_start_server";
                $http.get(url).then(function (response) {
                    $scope.remoteServerResult = response.data.result;
                })
            }   

            $scope.processList = new Array();
            $scope.getProcessList = function () {
                var url = "ajax/cluster?action=cluster_get_processlist";
                $http.get(url).then(function (response) {
                    var str = response.data.result;
                    $scope.processList = str.split("\r\n");
                    
                })

            }
            $scope.getProcessList();

            $scope.killProcess = function () {

            }

            $scope.newProcess = function () {
                var url = "ajax/cluster?action=cluster_new_process";
                $http.get(url).then(function (response) {
                    var str = response.data.result;
                    

                })
            }
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


