import { Controller } from "@hotwired/stimulus"

export default class extends Controller{
  static targets = ["expandOrgBtn", "closePreviewBtn", "orgpreview"]

  showOrganisation(e){
    this.orgpreviewTarget.hidden = false
    console.log(this.orgpreviewTarget);
  }
  showIndex(){
    this.orgpreviewTarget.hidden = true
  }
}
