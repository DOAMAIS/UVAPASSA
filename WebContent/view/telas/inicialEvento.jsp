<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <c:import url="/view/link.jsp" />
	<c:import url="../comum/navbar.jsp" />
	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

  <div class="limiter">
     <div class="container-login100">
        <div class="wrap-login100 p-t-85 p-b-20">
            <span class="login100-form-title p-b-70">
                  Bem vindo Nome do usuario!
            </span>
            <a href="inicialAtividade" class="button">Minhas atividades</a>          
              <c:forEach var="evento" items="${listaEventos}">
                  <div id="eventdi">
                  <div id="eventdiv">
                      <c:choose>
                        <c:when test="${not empty evento.foto }">
                            <img src="view/img/eventos/${evento.foto}" height="50" width="50">
                        </c:when>
                        <c:otherwise>
                            <img src="view/img/123.png" height="70" width="70">
                        </c:otherwise>
                      </c:choose>
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <b>${evento.nome}</b><br><hr>
                            <p style="color:black;">${evento.descricao}</p>
                  </div>
                            <hr id="q"> 
                    <table class="table table-striped custab">
                        <thead>
                            <tr>
                                <th>Atividades</th>
                                <th>Data</th>
                                <th>Hora</th>
                                <th></th>
                            </tr>
                        </thead>
     <c:forEach var="atividade" items="${listaAtividades}">
                            <c:if test="${evento.id == atividade.id_evento }">
                                <tr>
                                    <td>${atividade.nome}</td>
                                    <td><fmt:formatDate value="${atividade.data}" pattern="dd/MM/yyyy"/></td>
                                    <td>${atividade.horaInicio}</td>
                                    <td><button class="buttona">Participar</button>
                                </tr>
                            </c:if>
                        </c:forEach>
                  </table>
                  </div>
                  <br/>
            </c:forEach>
            </div>
           
        </div>
    </div>