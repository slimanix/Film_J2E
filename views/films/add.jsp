<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Ajouter un Film</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 h-screen flex items-center justify-center">
    <div class="max-w-lg mx-auto bg-white p-6 rounded-lg shadow-md">
        <h2 class="text-2xl font-bold mb-4 text-center">Ajouter un Nouveau Film</h2>
        
        <form action="<c:url value='/ajouter-film'/>" method="post" enctype="multipart/form-data">
            <div class="step" id="step-1">
                <div class="mb-4">
                    <label class="block text-gray-700">Titre :</label>
                    <input type="text" name="titre" class="w-full px-3 py-2 border rounded-md" required>
                </div>
                <div class="mb-4">
                    <label class="block text-gray-700">Description :</label>
                    <textarea name="description" class="w-full px-3 py-2 border rounded-md" required></textarea>
                </div>
                <button type="button" class="bg-blue-500 text-white px-4 py-2 rounded-md w-full" onclick="nextStep(2)">Suivant</button>
            </div>

            <div class="step hidden" id="step-2">
                <div class="mb-4">
                    <label class="block text-gray-700">Genre :</label>
                    <input type="text" name="genre" class="w-full px-3 py-2 border rounded-md" required>
                </div>
                <div class="mb-4">
                    <label class="block text-gray-700">Année de sortie :</label>
                    <input type="number" name="annee_sortie" class="w-full px-3 py-2 border rounded-md" required>
                </div>
                <div class="flex justify-between">
                    <button type="button" class="bg-gray-500 text-white px-4 py-2 rounded-md" onclick="prevStep(1)">Précédent</button>
                    <button type="button" class="bg-blue-500 text-white px-4 py-2 rounded-md" onclick="nextStep(3)">Suivant</button>
                </div>
            </div>

            <div class="step hidden" id="step-3">
                <div class="mb-4">
                    <label class="block text-gray-700">Réalisateur :</label>
                    <select name="id_realisateur" class="w-full px-3 py-2 border rounded-md" required>
                        <c:forEach var="realisateur" items="${realisateurs}">
                            <option value="${realisateur.id}">${realisateur.nom} ${realisateur.prenom}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="mb-4">
                    <label class="block text-gray-700">Acteurs :</label>
                    <select name="id_acteurs" multiple class="w-full px-3 py-2 border rounded-md" required>
                        <c:forEach var="acteur" items="${acteurs}">
                            <option value="${acteur.id}">${acteur.nom} ${acteur.prenom}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="mb-4">
                    <label class="block text-gray-700">Affiche du Film :</label>
                    <input type="file" name="poster" accept="image/*" class="w-full px-3 py-2 border rounded-md" required>
                </div>
                <div class="flex justify-between">
                    <button type="button" class="bg-gray-500 text-white px-4 py-2 rounded-md" onclick="prevStep(2)">Précédent</button>
                    <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded-md">Ajouter</button>
                </div>
            </div>
        </form>
    </div>

    <script>
        function nextStep(step) {
            document.querySelectorAll('.step').forEach(el => el.classList.add('hidden'));
            document.getElementById('step-' + step).classList.remove('hidden');
        }

        function prevStep(step) {
            document.querySelectorAll('.step').forEach(el => el.classList.add('hidden'));
            document.getElementById('step-' + step).classList.remove('hidden');
        }
    </script>
</body>
</html>