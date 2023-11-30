import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"


// Connects to data-controller="chatroom-subscription"
export default class extends Controller {
  static values = { chatroomId: Number }
  static targets = ["messages", "comment", "button", "responseInput", "resonseAuthorInput", "focusInput"]
  static values = { chatroomId: Number, currentUserId: Number }

  connect() {
    console.log(`Subscribed to the chatroom with the id ${this.chatroomIdValue}.`)
    this.#scrollDown()
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: data => this.#insertMessageAndScrollDown(data)}
    )
  }
  resetForm(event) {
    event.target.reset()

  }


  comment(event) {
    const message = event.currentTarget;

    message.querySelector("button").classList.remove("d-none")

  }

  disconnect() {
    this.channel.unsubscribe()
  }

  fillForm(e) {
    this.messageContent = e.currentTarget.closest("div").querySelector("p").innerText
    this.messageAuthor = e.currentTarget.closest("div").querySelector("small").innerText
    this.responseInputTarget.value = this.messageContent
    this.resonseAuthorInputTarget.value = this.messageAuthor
    this.focusInputTarget.focus()
  }

  #insertMessageAndScrollDown(data) {
    const currentUserIsSender = this.currentUserIdValue == data.sender_id
    const messageElement = this.#buildMessageElement(currentUserIsSender, data.message)
    this.messagesTarget.insertAdjacentHTML("beforeend", messageElement)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
    this.responseInputTarget.value = ""
    this.resonseAuthorInputTarget.value = ""
    this.#scrollDown()
  }

  #scrollDown() {
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

  #buildMessageElement(currentUserIsSender, message) {
    return `
      <div class="message-row d-flex ${this.#justifyClass(currentUserIsSender)}">
        <div class="${this.#userStyleClass(currentUserIsSender)}">
          ${message}
        </div>
      </div>
    `
  }

  #justifyClass(currentUserIsSender) {
    return currentUserIsSender ? "justify-content-end" : "justify-content-start"
  }

  #userStyleClass(currentUserIsSender) {
    return currentUserIsSender ? "sender-style" : "receiver-style"
  }
}
