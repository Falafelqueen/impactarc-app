import { Controller } from "@hotwired/stimulus"

export default class extends Controller{
  static targets = ["expandorgbtn", "closepreviewbtn", "orgpreview"]
  something = window.scrollY

  showOrganisation(e){
    const unsaveOrgBtn = document.querySelector(".save-org-btn-icon")
    const contentDiv = document.querySelector(".content-container")
    const contentDivPosition = contentDiv.getBoundingClientRect()
    const orgCards = document.querySelectorAll(".org-card")
    const body = document.querySelector("body")

    const top = 200
    console.log(screen.height);
    console.log(contentDiv, contentDivPosition, top);
    console.log(window.scrollY, window.pageYOffset);

    console.log(this.something);
/*     body.classList.add("stop-scrolling") */

   /*  if(window.scrollY >= 200){
      this.orgpreviewTarget.style.top = `${window.scrollY - top}px`
    } */
    const arrayWindowHeights = []
    if(!e.target.matches(".dont-open-preview-btn") && !e.target.matches(".close-btn-icon")){
      const originalWindowScroll = window.pageYOffset
      arrayWindowHeights.push(originalWindowScroll)
      console.log("originalwindowscroll:", originalWindowScroll, "array:", arrayWindowHeights);
      this.orgpreviewTarget.hidden = false
      window.scrollTo({
        top: 200,
        left: 500
      })
      arrayWindowHeights
    }

    if(e.target.matches(".close-btn-icon")){
       this.orgpreviewTarget.hidden = true
       console.log(arrayWindowHeights);
      /*  window.scrollTo({
         top: originalWindowScroll,
         left: 500
       }) */
     }
  }
}
