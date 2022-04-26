import { Controller } from "@hotwired/stimulus"

export default class extends Controller{
  static targets = ["expandorgbtn", "closepreviewbtn", "orgpreview"]

  showOrganisation(e){
    const unsaveOrgBtn = document.querySelector(".save-org-btn-icon")
    const contentDiv = document.querySelector(".content-container")
    const contentDivPosition = contentDiv.getBoundingClientRect()
    const top = 200
    console.log(screen.height);
    console.log(contentDiv, contentDivPosition, top);
    console.log(window.scrollY, window.pageYOffset);
    if(window.scrollY >= 200){
      this.orgpreviewTarget.style.top = `${window.scrollY - top}px`
    }
    if(!e.target.matches(".dont-open-preview-btn")){
      this.orgpreviewTarget.hidden = false
    }
  }
  showIndex(e){
    this.orgpreviewTarget.hidden = true
  }
}
