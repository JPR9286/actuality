class AskOpenaiForSummaryWithoutContent
  def initialize(title = nil, description = nil, length: 50)
    @title = title
    @description = description
    @length = length
    @client = OpenAI::Client.new
  end

  def call
    return unless text.present?

    response = @client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{ role: "user", content: prompt}],
      temperature: 0.2,
    })
    response['choices'].first['message']['content']
  end

  def prompt
    "rédige un résumé de #{@length} mots en français en te basant sur le text suivant sans citer la source, ni le journaliste, en restant neutre : #{text}."
  end

  def text
    [@title, @description].join(' ')
  end
end
