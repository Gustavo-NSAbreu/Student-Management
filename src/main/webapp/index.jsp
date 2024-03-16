<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- <link rel="stylesheet" href="style.css"> -->

  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      color: #f9fafb;
      -webkit-font-smoothing: antialiased;
    }

    body, main {
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    body {
      background: #09090b;
      width: 100%;
    }

    main {
      width: 1040px;
      gap: 2.5rem;
    }

    body, input, button, td {
      font-family: Verdana, Geneva, Tahoma, sans-serif;
      font-weight: 400;
      font-size: 1rem;
    }

    form {
      display: flex;
      flex-direction: column;
      align-items: center;
      gap: 1.75rem;
      color: #09090b;
    }
    
    dialog[open] {
      justify-self: center;
      align-self: center;

      display: flex;
      align-items: center;
    
      border: none;
      border-radius: 4px;
      padding: 1.5rem 2.5rem;

      background: #f9fafb;
    }

    dialog::backdrop {
      background: black;
      opacity: 0.7;
    }
    
    table {
      padding: 10px;
      border-collapse: collapse;
    }

    td, th {
      border-bottom: 1px solid #fff;
      min-width: 13rem;
      max-width: 13rem;
      height: 3rem;
      text-align: start;
      text-overflow: ellipsis;
      overflow: hidden;
      white-space: nowrap;
      padding: 0.5rem 1rem;
    }

    td:nth-last-child(2), th:nth-last-child(2) {
      text-align: end;
    }
    td:last-child, th:last-child {
      text-align: center;
    }

    input {
      color: black;
    }

    .header-container {
      display: flex;
      flex-direction: row;
      justify-content: space-between;
      align-items: center;
      width: 100%;
    }

    .table-container {
      min-width: fit-content;
    }

    #open-student-creation-modal-button {
      background: #f9fafb;
      color: #020617;
    }

    .modal-header {
      width: 100%;
      text-align: left;
      color: #09090b;
    }

    .student-modal-input-container {
      display: flex;
      gap: 0.35rem;
    }

    .student-modal-button-container {
      display: flex;
      justify-content: end;
      gap: 0.35rem;
      width: 100%;
    }

    .base-button {
      padding: 0.5rem 0.625rem;
      border: none;
      border-radius: 3px;
    }

    #create-student-button, .update-student-button {
      background: #020617;
    }

    .close-modal-button {
      background: #f9fafb;
      border: 1px solid #020617;
      color: #020617;
    }

    .base-text-input {
      padding: 6px;
      background: #f9fafb;
      border-radius: 4px;
      border: 1px solid #020617;
    }

    .text-black {
      color: #020617;
    }
    .delete-button {
      background-color: #9f1239;
    }

    .action-button-container {
      display: flex;
      justify-content: center;
      align-items: center;
      gap: 0.35rem;
    }
  
  </style>

  <title>Student Management</title>
</head>
<body>
  <main class="main-container">
    <header class="header-container">
      <h2 class="">Student Management</h2>
      <button class="base-button" id="open-student-creation-modal-button" type="button">+ New Student</button>
      <dialog id="student-creation-modal">
        <form action="student" method="post">
          <h3 class="modal-header">Create new student</h3>
          <div class="student-modal-input-container">
            <input type="hidden" name="method" value="POST">
            <input type="text" name="firstName" placeholder="First name" class="base-text-input" required>
            <input type="text" name="lastName" placeholder="Last Name" class="base-text-input" required>
          </div>
          <div class="student-modal-button-container">
            <button class="base-button" id="create-student-button" type="submit">Create</button>
            <button class="base-button close-modal-button" id="close-student-creation-modal-button" type="button">Cancel</button>
          </div>
        </form>
      </dialog>
    </header>
    <section class="table-container">
      <c:if test="${students == null}">
        <form action="student" method="get">
          <input type="hidden" name="method" value="GET">
          <button class="base-button text-black" type="submit">Fetch students</button>
        </form>
      </c:if>
      <c:if test="${students != null}">
        <table id="student-table">
          <thead>
            <tr>
              <th>ID</th>
              <th>First Name</th>
              <th>Last Name</th>
              <th>Registration</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="student" items="${students}">
              <tr>
                <td class="id-container">${student.id}</td>
                <td>${student.firstName}</td>
                <td>${student.lastName}</td>
                <td>${student.registration}</td>
                <td class="action-button-container">
                  <button class="base-button text-black open-student-update-modal-button" type="button">Update</button>
                  <dialog class="student-update-modal">
                    <form action="student" method="post">
                      <h3 class="modal-header">Update student</h3>
                      <div class="student-modal-input-container">
                        <input type="hidden" name="method" value="PUT">
                        <input type="hidden" name="id" value="${student.id}">
                        <input type="hidden" name="registration" value="${student.registration}">
                        <input type="text" name="firstName" placeholder="First name" class="base-text-input" required>
                        <input type="text" name="lastName" placeholder="Last Name" class="base-text-input" required>
                      </div>
                      <div class="student-modal-button-container">
                        <button class="base-button update-student-button" type="submit">Update</button>
                        <button class="base-button close-modal-button close-student-update-modal-button" type="button">Cancel</button>
                      </div>
                    </form>
                  </dialog>
                  <form action="student" method="get">
                    <input type="hidden" name="method" value="DELETE">
                    <input type="hidden" name="id" value="${student.id}">
                    <button class="base-button delete-button" type="submit">Delete</button>
                  </form>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </c:if>
      </table>
    </section>
  </main>
</body>
<script>
  const studentCreationModal = document.getElementById('student-creation-modal');
  document.getElementById('open-student-creation-modal-button')
    .addEventListener('click', () => studentCreationModal.showModal());
  document.getElementById('close-student-creation-modal-button')
    ?.addEventListener('click', () => studentCreationModal.close());

  const studentUpdateModals = document.querySelectorAll('.student-update-modal');
  document.querySelectorAll('.open-student-update-modal-button').forEach((button, index) => {
    button.addEventListener('click', () => studentUpdateModals[index].showModal());
  });
  document.querySelectorAll('.close-student-update-modal-button').forEach((button, index) => {
    button.addEventListener('click', () => studentUpdateModals[index].close());
  });
</script>
</html>
