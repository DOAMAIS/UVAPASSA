 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<c:import url="/view/linkcss.jsp" />
<link rel="stylesheet" href="../css/navbar.css" />
</head>
<nav class="navbar  navbar-fixed-top navbar-expand-lg "navbar navbar-light" style="background-color: #277554;">

  <a class="navbar-brand" href="#">uevents</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">

 
      <li class="nav-item">
       <a class="nav-link" href="exibirAlterarUsuario">Alterar Dados</a>
      </li>  
   </ul>      
   
    <a href="logout"><button class="btn btn-success pull-right">Sair</button></a>
   
  </div>
</nav>
