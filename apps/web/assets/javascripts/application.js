document.addEventListener('DOMContentLoaded', (evt) => {
  window.onclick = (event) => {
    if (!event.target.matches('.button-drop')) {
      const dropdowns = document.getElementsByClassName('dropdown-content');
      Array.from(dropdowns).map((openDropdown) => {
        if (openDropdown.classList.contains('show')) {
          openDropdown.classList.remove('show');
        }
      });
    }
  }

  document.getElementById('buttonDrop').addEventListener('click', () => {
    dropdown = document.getElementById('myDropdown');
    dropdown.classList.toggle('show');
  });
});
