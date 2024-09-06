require 'openai'

class OpenAIChatService
  def self.get_response(message)
    # This method will send the user's message to OpenAI's API and return the AI's response.
    # You will need to set up an OpenAI API key and add it to your environment variables.
    OpenAI.api_key = ENV['OPENAI_API_KEY']

    response = OpenAI::ChatCompletion.create(
      model: "gpt-3.5-turbo",
      messages: [
        { role: "system", content: "You are a helpful assistant." },
        { role: "user", content: message }
      ]
    )

    response['choices'].first['message']['content']
  rescue OpenAI::Error => e
    Rails.logger.error "OpenAI error: #{e.message}"
    "Sorry, I can't process your message right now."
  end
end