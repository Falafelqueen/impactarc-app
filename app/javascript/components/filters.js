function filterOrganisations (){
  const filterForm = document.getElementById("filter-form")
  const filterButton = document.getElementById("filter-btn")
  // it checkes wheter there are any filters applied
 filterButton.addEventListener("click",()=>{
   filterButton.value = "Remove filters"
   console.log("filtering stuff")
 })
  // when clicked it reloads the page with no filters
}

export { filterOrganisations}
