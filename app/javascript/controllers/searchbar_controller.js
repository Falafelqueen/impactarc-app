import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
   static targets = ["searchBar"]

   animateSearchBar(){
    if (this.searchBarTarget.classList.contains("active")) {
    this.searchBarTarget.classList.remove("active")
  } else {
    this.searchBarTarget.classList.add("active");
  }
   }
}
