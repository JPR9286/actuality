class AskOpenaiForSummary
  def initialize(text)
    @text = text
    @client = OpenAI::Client.new
  end

  def call
    return unless @text.present?

    response = @client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{ role: "user", content: prompt}],
      temperature: 0.2,
    })
    response['choices'].first['message']['content']
  end

  def prompt
    "résume en 50 mots le texte suivant en français sans cité sa source : #{@text}."
  end

end
