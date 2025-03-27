<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Liste des Acteurs</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 ">
<div class="flex justify-center">
<div class="w-full max-w-4xl ">
<div class="mt-20 flex justify-end mb-10">
    <a href="<c:url value='/views/acteurs/add.jsp'/>" class="bg-green-500 text-white px-4 py-2 rounded-md">Ajouter un Acteur</a>
</div>
<div class="flex justify-center">
    <div class="bg-white shadow-md rounded-lg p-6 w-full">
        <h2 class="text-xl font-bold mb-6 text-start text-gray-800">Liste des Acteurs</h2>
        <c:choose>
            <c:when test="${empty acteurs}">
                <p class="text-center text-gray-600 text-lg">Aucun acteur n'existe actuellement.</p>
            </c:when>
            <c:otherwise>
                <table class="w-full table-auto border-collapse">
                    <thead>
                        <tr class="bg-blue-500 text-white">
                            <th class="px-4 py-2 text-left">ID</th>
                            <th class="px-4 py-2 text-left">Nom</th>
                            <th class="px-4 py-2 text-left">Prénom</th>
                            <th class="px-4 py-2 text-left">Nationalité</th>
                             <th class="border p-2">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="acteur" items="${acteurs}">
                            <tr class="border-b hover:bg-gray-100">
                                <td class="px-4 py-2">${acteur.id}</td>
                                <td class="px-4 py-2">${acteur.nom}</td>
                                <td class="px-4 py-2">${acteur.prenom}</td>
                                <td class="px-4 py-2">${acteur.nationalite}</td>
                                 <td class="border p-2">
                    <a href="${pageContext.request.contextPath}/modifier-acteur?id=${acteur.id}"
                       class="bg-blue-500 text-white px-2 py-1 rounded">Modifier</a>
                    <a href="${pageContext.request.contextPath}/supprimer-acteur?id=${acteur.id}"
                       class="bg-red-500 text-white px-2 py-1 rounded"
                       onclick="return confirm('Êtes-vous sûr de vouloir supprimer ce acteur ?');">
                       Supprimer</a>
                          </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
    </div>
</div>
</div>
</div>
</body>
</html>