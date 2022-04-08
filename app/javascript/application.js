// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import { fetchingAPI } from "./components/zip_code_autofill"
import { animateSearch } from "./components/animate_searchbar"
import { filterOrganisations } from "./components/filters";
import { sortResults } from "./components/sort_results";

document.addEventListener("turbo:load", ()=>{
  console.log("page loaded")
  animateSearch()
  if(document.getElementById("sort-icon")){
    sortResults()
  }
})
