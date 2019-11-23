const initFormToggler = (selector, form_selector) => {
  const button = document.querySelector(selector);
  const form = document.querySelector(form_selector);
  if (button) {
    button.addEventListener('click', (event) => {
      if (form.classList.contains('visible')) {
        form.classList.remove('visible');
        button.innerText = "+ Add Ingredient";
        } else {
        form.classList.add('visible');
        button.innerText = "Close form";
      }
    })
  }
};

export { initFormToggler };









