function sortResults(){
  const organisations = document.querySelectorAll(".org-card-info")
  const sortBtn = document.getElementById("sort-icon")
  sortBtn.addEventListener("click",()=>{
    console.log(organisations)
  })
}

export {sortResults}
