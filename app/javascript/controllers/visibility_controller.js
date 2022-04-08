import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["hideable","showBtn", "hideBtn"]

  showTargets(){
    const element = this.hideableTarget
    element.hidden = false
    this.showBtnTarget.hidden = true
    this.hideBtnTarget.hidden = false
  }
  hideTargets(){
    const element = this.hideableTarget
    element.hidden = true
    this.hideBtnTarget.hidden = true
    this.showBtnTarget.hidden = false
  }
}
