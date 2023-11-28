import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"


// Connects to data-controller="chatroom-subscription"
export default class extends Controller {
  static values = { chatroomId: Number }
  static targets = ["messages"]

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
    console.log('send')
  }

  disconnect() {
    this.channel.unsubscribe()
  }

  #insertMessageAndScrollDown(data) {
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    this.#scrollDown()
  }

  #scrollDown() {
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }
}
