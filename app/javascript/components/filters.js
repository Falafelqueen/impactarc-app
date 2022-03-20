const filterOrganisations =()=>{
  const applyResetBtn = document.querySelector(".side-bar input[type='submit']")
  const filterForm = document.querySelector(".side-bar form")
  filterForm.addEventListener("submit", (e)=>{
    e.preventDefault();
    filterForm.submit();
    applyResetBtn.value = "Remove filters"
  })

}

export { filterOrganisations}
