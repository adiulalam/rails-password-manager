import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static values = {
        content: String
    }

    connect() {
        this.originalHTML = this.element.innerHTML // Store the original icon HTML
    }

    copy() {
        navigator.clipboard.writeText(this.contentValue).then(
            () => {
                this.element.textContent = "Copied!"
                setTimeout(() => {
                    this.element.innerHTML = this.originalHTML // Revert to the icon
                }, 1000)
            },
            () => {
                alert("Failed to copy to clipboard")
            }
        );
    }
}
