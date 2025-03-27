<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Films</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-900 text-white p-10">
    <div class="container mx-auto">
        <h1 class="text-3xl font-bold mb-6 text-center">Liste des Films</h1>
        
        <!-- Bouton Ajouter un Film -->
        <div class="text-center mb-6">
            <a href="${pageContext.request.contextPath}/ajouter-film" class="bg-blue-600 hover:bg-blue-700 text-white py-2 px-4 rounded">
                Ajouter un Film
            </a>
        </div>

        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
            <c:choose>
                <c:when test="${empty films}">
                    <p class="text-center text-gray-400 text-lg col-span-full">Aucun film n'existe actuellement.</p>
                </c:when>
                <c:otherwise>
                    <c:forEach var="film" items="${films}">
                        <div class="bg-gray-800 rounded-lg shadow-lg overflow-hidden">
                            <img src="${pageContext.request.contextPath}/uploads/${film.poster}" 
                                 alt="Poster du film" class="w-full h-64 object-cover">
                            <div class="p-4">
                                <h2 class="text-xl font-semibold">${film.titre}</h2>
                                <p class="text-gray-400">Genre: ${film.genre}</p>
                                <p class="text-gray-400">Année: ${film.anneeSortie}</p>
                            </div>
                        </div>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</body>
</html>
