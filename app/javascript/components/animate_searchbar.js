function animateSearch() {
  const searchIcon = document.querySelector(".search-icon")
  searchIcon.addEventListener("click", () => {
    console.log("clicked search icon");
    const searchBar = document.querySelector(".search-bar")
    if (searchBar.classList.contains("active")) {
      searchBar.classList.remove("active")
    } else {
      searchBar.classList.add("active");
    }
  })
}

export { animateSearch }
