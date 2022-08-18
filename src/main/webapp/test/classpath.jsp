<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Vector"%>
<%@page import="com.raonsnc.oacx.OneAccessCxApplication"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"   pageEncoding="UTF-8"%>

<%

Set<String> jar_file_set = new HashSet<String>();
Set<String> cls_file_set = new HashSet<String>();
try {
	ClassLoader CL = OneAccessCxApplication.class.getClassLoader();
	Class CL_class = CL.getClass();
    while (CL_class != java.lang.ClassLoader.class) {
        CL_class = CL_class.getSuperclass();
    }
    
    
    java.lang.reflect.Field ClassLoader_classes_field = CL_class.getDeclaredField("classes");
    ClassLoader_classes_field.setAccessible(true);
    Vector classes = (Vector) ClassLoader_classes_field.get(CL);
    Iterator class_iter = classes.iterator();
   
    while(class_iter.hasNext()) {
    	Class class_object = (Class) class_iter.next();
    	
    	if(class_object.getProtectionDomain() != null && class_object.getProtectionDomain().getCodeSource() != null) {
    		
    		String file_name = class_object.getProtectionDomain().getCodeSource().getLocation().getPath();//new File(class_object.getProtectionDomain().getCodeSource().getLocation().toURI()).getPath();
    		if(file_name.endsWith(".jar")) {
    			jar_file_set.add(file_name);
    		}else{
    			cls_file_set.add(file_name);
    		}
    		
    	}
    }
}catch (Exception e) {
	e.printStackTrace();
	throw e;
}
%>

<!DOCTYPE html>
<html>
<head>
<style>
  .table {
  	width:98%;
  }
  table {
  	margin: auto; width: 100%;
  }
  table, th, td {
    border: 1px solid #bcbcbc;
  }
  #jar {
  	text-align: center; font-weight:bold; color: #e74c3c; width:10%;
  }
  #class {
  	text-align: center;  color: #16a085;
  }

</style>
<meta charset="EUC-KR">
<title>ClassLoader</title>
</head>
<body>
<div class="table">
<table>
<thead>
	<tr>
		<th>�׸�</th>
		<th>����</th>
	</tr>
</thead>


<%
for (String jar_file_name : jar_file_set) {
%>
	<tbody>
		<tr>
			<th id="jar">jar file</th>
			<td><%=jar_file_name %></td>
		</tr>
	</tbody>
	
<%	
}
%>	
<%
for (String cls_file_name : cls_file_set) {
%>
	<tr>
		<th id="class">class file</th>
		<td><%=cls_file_name %></td>
	</tr>
<%	
}
%>
</div>
</table>
</body>
</html>