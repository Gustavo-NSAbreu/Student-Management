<%@ page language="java" contentType="text/html;charset=UTF-8" %>
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
    }

    body {
      background: #09090b;
      -webkit-font-smoothing: antialiased;
    }

    body, input, button {
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
      width: inherit;
    }

    tr {
      height: 3rem;
    }

    table {
      border-collapse: collapse;
    }
    
    td, th {
      border-bottom: 1px solid #fff;
      min-width: 13rem;
      text-align: start;
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

    .main-container {
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      gap: 2.5rem;

      width: 100%;
      height: 100vh;
    }

    .w-45 {
      width: 45rem;
    }

    .header-container {
      display: flex;
      flex-direction: row;
      justify-content: space-between;
      align-items: center;
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

    .student-creation-modal-input-container {
      display: flex;
      gap: 0.35rem;
    }

    .student-creation-modal-button-container {
      display: flex;
      justify-content: end;
      gap: 0.35rem;

      width: 100%;
    }

    .base-button {
      padding: 5px 10px;
      border: none;
      border-radius: 3px;
    }

    #create-student-button {
      background: #09090b;
    }

    #close-student-creation-modal-button {
      background: #f9fafb;
      border: 1px solid #09090b;
      color: #09090b;
    }

    .base-text-input {
      padding: 6px;
      background: #f9fafb;
      border-radius: 4px;
      border: 1px solid #09090b;
    }

    .update-button {
      color: black;
    }
    .delete-button {
      background-color: red;
    }
  
  </style>

  <title>Student Management</title>
</head>
<body>
  <main class="main-container">
    <header class="header-container w-45">
      <h2 class="">Student Management</h2>
      <button class="base-button" id="open-student-creation-modal-button" type="button">+ New Student</button>
      <dialog id="student-creation-modal">
        <form action="student" method="post">
          <h3 class="modal-header">Create new student</h3>
          <div class="student-creation-modal-input-container">
            <input type="text" name="firstName" placeholder="First name" class="base-text-input" required>
            <input type="text" name="lastName" placeholder="Last Name" class="base-text-input" required>
          </div>
          <div class="student-creation-modal-button-container">
            <button class="base-button" id="create-student-button" type="submit">Create</button>
            <button class="base-button" id="close-student-creation-modal-button" type="button">Cancel</button>
          </div>
        </form>
      </dialog>
    </header>
    <section class="table-container">
      <table>
        <thead>
          <tr>
            <th>ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Student ID</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>q wjdc;j rv;13jrw v</td>
            <td>John</td>
            <td>Doe</td>
            <td>234875</td>
            <td>
              <button class="base-button update-button">Update</button>
              <dialog>
                
              </dialog>
              <button class="base-button delete-button">Delete</button>
            </td>
          </tr>
          <tr>
            <td>q wjdc;j rv;13jrw v</td>
            <td>John</td>
            <td>Doe</td>
            <td>234875</td>
            <td>
              <button class="base-button update-button">Update</button>
              <button class="base-button delete-button">Delete</button>
            </td>
          </tr>
          <tr>
            <td>q wjdc;j rv;13jrw v</td>
            <td>John</td>
            <td>Doe</td>
            <td>234875</td>
            <td>
              <button class="base-button update-button">Update</button>
              <button class="base-button delete-button">Delete</button>
            </td>
          </tr>
          <tr>
            <td>q wjdc;j rv;13jrw v</td>
            <td>John</td>
            <td>Doe</td>
            <td>234875</td>
            <td>
              <button class="base-button update-button">Update</button>
              <button class="base-button delete-button">Delete</button>
            </td>
          </tr>
          <tr>
            <td>q wjdc;j rv;13jrw v</td>
            <td>John</td>
            <td>Doe</td>
            <td>234875</td>
            <td>
              <button class="base-button update-button">Update</button>
              <button class="base-button delete-button">Delete</button>
            </td>
          </tr>
          <tr>
            <td>q wjdc;j rv;13jrw v</td>
            <td>John</td>
            <td>Doe</td>
            <td>234875</td>
            <td>
              <button class="base-button update-button">Update</button>
              <button class="base-button delete-button">Delete</button>
            </td>
          </tr>
          <tr>
            <td>q wjdc;j rv;13jrw v</td>
            <td>John</td>
            <td>Doe</td>
            <td>234875</td>
            <td>
              <button class="base-button update-button">Update</button>
              <button class="base-button delete-button">Delete</button>
            </td>
          </tr>
          <tr>
            <td>q wjdc;j rv;13jrw v</td>
            <td>John</td>
            <td>Doe</td>
            <td>234875</td>
            <td>
              <button class="base-button update-button">Update</button>
              <button class="base-button delete-button">Delete</button>
            </td>
          </tr>
        </tbody>
      </table>
    </section>
  </main>
</body>
<script>
  const studentCreationModal = document.getElementById('student-creation-modal');
  document.getElementById('open-student-creation-modal-button')
    .addEventListener('click', () => studentCreationModal.showModal());
  document.getElementById('close-student-creation-modal-button')
    .addEventListener('click', () => studentCreationModal.close());
  const studentUpdateModal = document.getElementById('student-update-modal');
  document.getElementById('open-student-update-modal-button')
    .addEventListener('click', () => studentUpdateModal.showModal());
  document.getElementById('close-student-update-modal-button')
    .addEventListener('click', () => studentUpdateModal.close());
</script>
</html>
