import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form"]



 submitForm(event){
   console.log("something could happen on form submition");
   let isValid = this.validateForm(this.formTarget)
   if (!isValid) {
     event.preventDefault();
   }
   else{
     this.formTarget.submit()
     console.log("it could be submitted");
   }
 }

  validateForm() {
    let isValid = true;
    console.log("validating something?");
    let requiredFieldSelectors = 'textarea:required, input:required';
    let requiredFields = this.formTarget.querySelectorAll(requiredFieldSelectors);

    requiredFields.forEach((field) => {
      if (!field.disabled && !field.value.trim()) {
        field.focus();
        field.classList.add("invalid")
        isValid = false;
        return false;
      }
      else{
        field.classList.remove("invalid")
      }
    });

    // If we already know we're invalid, just return false
    if (!isValid) {
      field.classList.add("invalid")
      return false;
    }

    // Search for any browser invalidated input fields and focus them
    let invalidFields = this.formTarget.querySelectorAll('input:invalid');

    invalidFields.forEach((field) => {
      if (!field.disabled) {
        field.focus();
        isValid = false;
        field.classList.add("invalid")
      }
      else{
        field.classList.remove("invalid")
      }
    });

    return isValid;
  }
  validateField(e){
    let typingTimer
    const doneTypingTimer = 1000
    let requiredFieldSelectors = 'textarea:required, input:required';
    let requiredFields = this.formTarget.querySelectorAll(requiredFieldSelectors);
    console.log(requiredFields);
    requiredFields.forEach(field =>{
      if(field == e.target){
        if (!field.checkValidity()){
        clearTimeout(typingTimer)
         typingTimer = setTimeout(() => {
            field.classList.add("invalid")
          }, doneTypingTimer);
        }
        else{
          field.classList.remove("invalid")
        }
      }
    })
  }

}
