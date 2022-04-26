import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["showDropdownBtn", "dropdownList"]
   toggleDropdown(){
     const dropdown = this.dropdownListTarget.classList

     if(dropdown.contains("show")){
       dropdown.remove("show")
     }
     else{
       dropdown.add("show")
     }
   }
}
