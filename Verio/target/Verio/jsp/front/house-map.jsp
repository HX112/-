<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>地图</title>
        <script type="text/javascript"
                src="https://api.map.baidu.com/api?v=2.0&ak=2ew5pbvPi9Mu8joy9zXzbDVW"></script>
    </head>
    <body>

        <style type="text/css">
            #allmap {
                width: 100%;
                height: 100%;
                overflow: hidden;
                margin: 0;
                position: absolute;
                padding-bottom: 20px;
            }
        </style>
        <div id="allmap"></div>
        <script type="text/javascript">
            //var api = frameElement.api, W = api.opener; // api.opener 为载加lhgdialog.min.js文件的页面的window对象
            //保存标注点
            function save_maps() {
                document.getElementById('maps').value
                api.close();
            }

            //设置地图默认的鼠标指针样式
            var is_bz = false;

            function set_cursor() {
                is_bz = true;
                map.setDefaultCursor("crosshair");
            }

            // 百度地图API功能
            var map = new BMap.Map("allmap");
            map.centerAndZoom(new BMap.Point(${longitude}, ${latitude}), 14);
            map.enableScrollWheelZoom(); //可以鼠标滚动 缩放比例尺


            map.addEventListener("click", function (e) {
                if (!is_bz) {
                    return;
                }
                map.clearOverlays()
                var point = new BMap.Point(e.point.lng, e.point.lat);
                document.getElementById('maps').value = e.point.lng + ',' + e.point.lat;
                var marker = new BMap.Marker(point); // 创建标注
                map.addOverlay(marker); // 将标注添加到地图中
                //marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
                marker.enableDragging(); //可拖拽
                marker.addEventListener("dragend", function (e) {
                    var p = marker.getPosition(); //获取marker的位置
                    document.getElementById('maps').value = p.lng + ',' + p.lat;
                });
                //is_bz=false;
            });

            //地图增加信息窗口

            var point = new BMap.Point(${longitude}, ${latitude});
            var marker = new BMap.Marker(point); // 创建标注
            map.addOverlay(marker); // 将标注添加到地图中
            var sContent =
                "<div style='padding:10px;'><span style='font-size:12px;font-weight:bold;'>${address}</span></div>";
            var infoWindow = new BMap.InfoWindow(sContent); // 创建信息窗口对象
            marker.addEventListener("click", function () {
                this.openInfoWindow(infoWindow);
                infoWindow.redraw(); //防止在网速较慢，图片未加载时，生成的信息框高度比图片的总高度小，导致图片部分被隐藏
            });
            marker.openInfoWindow(infoWindow);

            //地图增加可视区域关键字搜索
            map.addControl(new BMap.MapTypeControl({
                mapTypes: [BMAP_NORMAL_MAP, BMAP_HYBRID_MAP]
            })); //2D图，卫星图
            map.addControl(new BMap.MapTypeControl({
                anchor: BMAP_ANCHOR_TOP_RIGHT
            })); //左上角，默认地图控件


            map.addControl(new BMap.NavigationControl()); //添加默认缩放平移控件
            map.addControl(new BMap.NavigationControl({
                anchor: BMAP_ANCHOR_BOTTOM_LEFT,
                type: BMAP_NAVIGATION_CONTROL_PAN
            })); //左下角，仅包含平移按钮
        </script>


    </body>
</html>