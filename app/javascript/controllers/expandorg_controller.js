import { Controller } from "@hotwired/stimulus"

export default class extends Controller{
  static targets = ["expandOrgBtn", "closePreviewBtn", "orgpreview"]

  showOrganisation(e){
    const contentDiv = document.querySelector(".content-container")
    const contentDivPosition = contentDiv.getBoundingClientRect()
    const top = 200
    console.log(screen.height);

    console.log(contentDiv, contentDivPosition, top);
    console.log(window.scrollY, window.pageYOffset);


    if(window.scrollY >= 200){
      this.orgpreviewTarget.style.top = `${window.scrollY - top}px`
    }

    console.log(this.orgpreviewTarget.style.top);
    this.orgpreviewTarget.hidden = false

    console.log(this.orgpreviewTarget);
  }
  showIndex(){
    this.orgpreviewTarget.hidden = true
  }
}
