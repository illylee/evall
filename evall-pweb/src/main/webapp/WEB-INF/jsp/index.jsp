<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>EV World</title>
    <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet">
    <link href="/css/one-page-wonder.css" rel="stylesheet">
</head>

<body>

<nav class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top">
    <div class="container">
        <a class="navbar-brand" href="#">EV World</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#">Sign Up</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Log In</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Community</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">News</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">REVIEW</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">STORE</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<header class="masthead">
    <div class="masthead-content">
        <div class="container">
            <input id="searchKeyword" placeholder="" />
            <span class="input-group-btn">
                <a href="javascript:search();" class="btn btn-primary rounded-pill">search</a>
            </span>
        </div>
    </div>
    <br/>
    <div id="map" style="width:100%;height:350px;"></div>
</header>
<footer class="py-5 bg-black">
    <div class="container">
        <p class="m-0 text-center text-white small">Copyright &copy; EV World 2020</p>
    </div>
</footer>
</body>

<!-- Bootstrap core JavaScript -->
<script src="/vendor/jquery/jquery.min.js"></script>
<script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=711be37f66ca3c67cf6b44298b6c6232&libraries=services,clusterer,drawing"></script>
<script>

    var infowindow;
    var map;
    var ps;

    // 키워드 검색 완료 시 호출되는 콜백함수 입니다
    function placesSearchCB (data, status, pagination) {
        if (status === kakao.maps.services.Status.OK) {

            // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
            // LatLngBounds 객체에 좌표를 추가합니다
            var bounds = new kakao.maps.LatLngBounds();

            for (var i=0; i<data.length; i++) {
                displayMarker(data[i]);
                bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
            }

            // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
            map.setBounds(bounds);

        }
    }

    // 지도에 마커를 표시하는 함수입니다
    function displayMarker(place) {

        // 마커를 생성하고 지도에 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: new kakao.maps.LatLng(place.y, place.x)
        });

        infowindow = new kakao.maps.InfoWindow({zIndex:1});

        // 마커에 클릭이벤트를 등록합니다
        kakao.maps.event.addListener(marker, 'click', function() {
            infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
            infowindow.open(map, marker);
        });
    }


    function search(){
        var keyword = $("#searchKeyword").val();
        ps.keywordSearch(keyword, placesSearchCB);
    }


    jQuery(document).ready(function() {

        var mapContainer = document.getElementById('map'), // 지도를 표시할 div
            mapOption = {
                center: new kakao.maps.LatLng(37.4875304, 127.103703), // 지도의 중심좌표
                level: 6
            };

        map = new kakao.maps.Map(mapContainer, mapOption);
        ps = new kakao.maps.services.Places(map);
        ps.categorySearch('OL7', placesSearchCB, {useMapBounds:true});


        // if(navigator.geolocation) {
        //     navigator.geolocation.getCurrentPosition(function(position) {
        //
        //         console.log(position.coords.latitude);
        //         console.log(position.coords.longitude);
        //
        //         var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        //             mapOption = {
        //                 center: new kakao.maps.LatLng(37.4875304, 127.103703), // 지도의 중심좌표
        //                 level: 6
        //             };
        //
        //         map = new kakao.maps.Map(mapContainer, mapOption);
        //         ps = new kakao.maps.services.Places(map);
        //         ps.categorySearch('OL7', placesSearchCB, {useMapBounds:true});
        //
        //     }, function(error) {
        //         console.log(error);
        //     });
        // } else {
        //     console.log("Geolocation을 지원하지 않는 브라우저 입니다.");
        // }
    });

</script>


</html>
