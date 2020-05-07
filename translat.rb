require 'open-uri'
require 'json'

class Traducao
  #Link para acessar o tradutor
  BASE_URI = 'https://translate.yandex.net/api/v1.5/tr.json/translate'.freeze
  #Minha key para ter acesso ao tradutor
  API_KEY = 'trnsl.1.1.20200507T003230Z.e77137b2d73688dd.d446a7cbd644ae0313ce6d9f27987d64433a3058'.freeze

  attr_accessor :text, :current_language, :texttranslate, :destination_language
  def initialize(text, current_language, destination_language)
    @text = text
    @current_language = current_language
    @destination_language = destination_language
  end

  def traduzir
    puts 'Efetuando tradu��o...'

    # abre a API de tradu��o para pegar o resultado
    response = open("#{BASE_URI}?key=#{API_KEY}&text=#{@text}&lang=#{@current_language}-#{@destination_language}").read

    # retorna um array de uma posicao
    json = JSON.parse(response)
    @texttranslate = json['text'][0]

    #imprime na tela na tradu��o
    puts "Texto traduzido de #{@current_language} para #{@destination_language}: #{@texttranslate}"

    #chama o m�todo para salvar a tradu��o
    salva_traducao
  end

  # cria um arquivo e salva a tradu��o nele
  def salva_traducao
  	# para criar o nome do arquivo no fomato data-de-hoje_hora:minutos
    time = Time.new
    file_name = time.strftime('%m-%d-%Y')+ '.txt'

    line = "Hora da tradu��o: #{time.strftime('%H:%M')}\n#{@current_language}: #{@text}\n#{@destination_language}: #{@texttranslate}"

    # abre o arquivo, se n�o existir cria.
    # depois adiciona as linhas novas e fecha
    File.open(file_name.to_s, 'a+') do |newline|	# "a" acrescenta no final do arquivo
      newline.puts(line)
    end
  end
end
