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
    const previewCards = document.querySelectorAll(".org-preview")

    const top = 200
    const topMobile = 137
    console.log(screen.height);
    console.log(contentDiv, contentDivPosition, top);
    console.log(window.scrollY, window.pageYOffset);

    console.log(this.something);
/*     body.classList.add("stop-scrolling") */

    if(window.scrollY >= top){
      console.log("screen widths:", window.innerWidth);
      if (window.innerWidth <= 670){
        this.orgpreviewTarget.style.top = `${window.scrollY - topMobile  }px`
      }
      else{
        this.orgpreviewTarget.style.top = `${window.scrollY - top + 3}px`
      }
    }

    // clicking on a card to open preview
    if(!e.target.matches(".dont-open-preview-btn") && !e.target.matches(".close-btn-icon")){
      const originalWindowScroll = window.pageYOffset

      // close those which were open
      previewCards.forEach(previewCard => {
        previewCard.hidden = true
      })
      // open the one being clicked
      this.orgpreviewTarget.hidden = false

      window.scrollTo({
        top: originalWindowScroll,
        left: 500
      })

    }
    // closing preview
    if(e.target.matches(".close-btn-icon")){
       this.orgpreviewTarget.hidden = true
     }
  }
}
