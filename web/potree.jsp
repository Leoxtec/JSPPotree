<%-- 
    Document   : Potree
    Created on : 10-oct-2016, 12:27:20
    Author     : alrodriguez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "all.mapas"%> 
<%@ page import = "all.Consulta"%> 
<%@ page import = "java.util.LinkedList"%> 

<html lang="en">
  <head>
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Potree Viewer</title>

	<link rel="stylesheet" type="text/css" href="libs/potree/potree.css">
	<link rel="stylesheet" type="text/css" href="libs/jquery-ui-1.11.4/jquery-ui.css">
	<link rel="stylesheet" href="libs/openlayers3/ol.css" type="text/css">
  </head>

  <body>
  
	<script src="libs/jquery-2.1.4/jquery-2.1.4.min.js"></script>
	<script src="libs/jquery-ui-1.11.4/jquery-ui.min.js"></script>
	<script src="libs/three.js/build/three.js"></script>
	<script src="libs/other/stats.min.js"></script>
	<script src="libs/other/BinaryHeap.js"></script>
	<script src="libs/tween/tween.min.js"></script>
	<script src="libs/d3/d3.js"></script>
	<script src="libs/proj4/proj4.js"></script>
	<script src="libs/openlayers3/ol.js"></script>
	
	<script src="libs/potree/potree.js"></script>
	
	<!-- INCLUDE ADDITIONAL DEPENDENCIES HERE -->
	
	<script src="libs/plasio/js/laslaz.js"></script>
	<script src="libs/plasio/vendor/bluebird.js"></script>
	<script src="libs/potree/laslaz.js"></script>
	
        <input type="text" id="mapa">
    <div class="potree_container" style="position: absolute; width: 55%; height: 55%; left: 0px; top: 0px; ">
	
		<div id="potree_render_area">
			<div id="potree_map" class="mapBox" style="position: absolute; left: 50px; top: 50px; width: 400px; height: 400px; display: none">
				<div id="potree_map_header" style="position: absolute; width: 100%; height: 25px; top: 0px; background-color: rgba(0,0,0,0.5); z-index: 1000; border-top-left-radius: 3px; border-top-right-radius: 3px;">
				</div>
				<div id="potree_map_content" class="map" style="position: absolute; z-index: 100; top: 25px; width: 100%; height: calc(100% - 25px); border: 2px solid rgba(0,0,0,0.5); box-sizing: border-box;"></div>
			</div>
		
			<!-- HEADING -->
			<div id="potree_description" class="potree_info_text"></div>
		</div>
		
		<div id="potree_sidebar_container"> </div>
    </div>
	
	<script>
	
		var onPointCloudLoaded = function(event){
			// do stuff here that should be executed whenever a point cloud has been loaded.
			// event.pointcloud returns the point cloud object
			console.log("a point cloud has been loaded");
		}; 
	
		viewer = new Potree.Viewer(document.getElementById("potree_render_area"), {
			"onPointCloudLoaded": onPointCloudLoaded
		});
		
		//viewer.setEDLEnabled(false);
		viewer.setPointSize(1.5);
		viewer.setMaterial("ELEVATION");
		viewer.setFOV(45);
		viewer.setPointSizing("Fixed");
		viewer.setQuality("Circles");
		viewer.setPointBudget(1*1000*1000);
		
		document.title = "INEGI";
		viewer.setEDLEnabled(true);
		viewer.setShowSkybox(false);
		viewer.setMaterialID(Potree.PointColorType.ELEVATION);
		viewer.setDescription('');
		
		viewer.loadSettingsFromURL();
		
		//viewer.setDescription("Potree 1.4RC. Use this for testing purposes only! Check <a href='https://twitter.com/m_schuetz' target='_blank'>here</a> for new updates.<br>"
		//	+ "Report issues on the <a href='https://github.com/potree/potree' target='_blank'>github repository</a> or <a href='mailto:mschuetz@potree.org' target='_blank'>mschuetz@potree.org</a><br>"
		//	+ "Point cloud courtesy of <a href='http://sigeom.ch/' target='_blank'>sigeom sa</a>"
		//	
		//);
		
		
		  /*<?php
            $consulta=pg_query($con,"SELECT nombre FROM prueba");
            while($row=pg_fetch_array($consulta)){
            ?>
            <tr><td class="celdas_nombre"><?php echo $row["Id"];?></td></tr>
            <?php
            }
            ?>*/
    
    <%
        int x=Integer.parseInt(request.getParameter("mapa"));
       int mapa=x;
                LinkedList<mapas> lista = Consulta.getMapas(mapa);
                
			
		for(int a=0;a<lista.size();a++){
                    out.println("viewer.addPointCloud('"+ lista.get(a).getPath() +"');");
                }
		//viewer.addPointCloud("pointclouds/inegi2/cloud.js");
		//viewer.addPointCloud("pointclouds/inegi3/cloud.js");
		//viewer.addPointCloud("pointclouds/inegi4/cloud.js");

		//viewer.addPointCloud("pointclouds/barcelona/cloud.js");
		
    %>
        		viewer.loadGUI();

        </script>
        
  </body>
</html>
