class AskOpenaiForSummary
  def initialize(text)
    @text = text
    @client = OpenAI::Client.new
  end

  def call
    return unless @text.present?

    response = @client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{ role: "user", content: prompt}]
    })
    response['choices'].first['message']['content']
  end

  def prompt
    "À la manière d'un article de presse, peux-tu me générer un résumé en 50 mots du texte suivant : #{@text}."
  end

end
