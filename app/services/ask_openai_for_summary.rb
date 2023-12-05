class AskOpenaiForSummary
  def initialize(text, length: 10)
    @text = text
    @length = length
    @client = OpenAI::Client.new
  end

  def call
    return unless @text.present?

    puts "calling openai..."
    response = @client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{ role: "user", content: prompt}],
      temperature: 0.2,
    })
    response['choices'].first['message']['content']
  end

  def prompt
    "rédige 4 lignes de maximum #{@length} mots en français en te basant sur le texte suivant : #{@text}."
  end

end
