import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["sidebar", "openSidebarBtn"]

  openSidebar(){
    this.openSidebarTarget.style.display = "none"
  }
}
