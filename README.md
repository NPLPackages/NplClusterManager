# NplClusterManager is a paracraft plugin (Mod)

* Run git clone https://github.com/NPLPackages/NplClusterManagerat at mod directory "ParaCraftSDK/_mod".

debug mod="NplClusterManager" isDevEnv="true" dev="C:\Users\lizhiqiang\Desktop\ParaCraftSDK\_mod\NplClusterManager\"


Reference:
- [How To Create Paracraft Mod](https://github.com/LiXizhi/NPLRuntime/wiki/TutorialParacraftMod)
- [Download paracraft](http://www.paracraft.cn)

## 项目描述 
NPL集群管理是一个对可平行扩展的服务器集群中的NPL 进程的管理与服务平台。 NPL是我们自主研发的脚本语言。本项目需要使用NPL语言配合Linux Bash等命令行工具完成。

在Wiki上写出更具体的项目需求与设计文档
开发中央管理与监控Web网站
开发公共Rest API接口，提供NPL进程服务
应用场景1：

渲染农场：通过API，自动启动云端某台计算机上的一个NPL进程，下载相应的模块代码并运行，将结果返回，并自动释放进程。
应用场景2：

世界服务器：通过API，自动启动云端某台计算机上的一个NPL进程，下载相应的模块代码并运行Paracraft私服，并返回IP:port给用户， 用户可直接连接, 世界中不再有用户一段时间后， 自动退出进程。

## 参考网站或产品
http://docs.openstack.org/
https://github.com/LiXizhi/NPLRuntime/wiki/



