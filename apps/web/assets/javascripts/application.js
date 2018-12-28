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

  const buttonDrop = document.getElementById('buttonDrop');
  const dismiss = document.getElementById('dismiss')

  if (buttonDrop) {
    document.getElementById('buttonDrop').onclick = () => {
      const dropdown = document.getElementById('myDropdown');
      dropdown.classList.toggle('show');
    };
  }

  if (dismiss) {
    dismiss.onclick = () => {
      document.getElementById('flash').remove();
    };
  }
});
