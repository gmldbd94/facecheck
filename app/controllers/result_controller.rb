require 'net/http'
class ResultController < ApplicationController
  def result
    @user = Scafd.find(params[:id])
    if @user.score.to_i <= 5
      @reslut = 10
      @content_title = "그냥 학교 다니자"
      @content_sub = "교수하는건 어때?"
    elsif @user.score.to_i == 15
      @reslut = 100
      @content_title = "무조건, 무조건 	자퇴!"
      @content_sub = "당신은 자퇴와 소울 메이트입니다. 하루 빨리 자퇴하세요."
    elsif @user.score.to_i > 10
      @reslut = 70
      @content_title = "자퇴각이 보이네"
      @content_sub = "인생 한번쯤 자퇴해도 괜찮을듯?"
    else
      @reslut = 40
      @content_title ="자퇴하기는 애매한데,,"
      @content_sub ="당신은 휴학이 적당한거 같네"
    end
    # NOTE: You must use the same region in your REST call as you used to obtain your subscription keys.
    #   For example, if you obtained your subscription keys from westus, replace "westcentralus" in the
    #   URL below with "westus".
    uri = URI('https://westcentralus.api.cognitive.microsoft.com/face/v1.0/detect')
    uri.query = URI.encode_www_form({
       'returnFaceId' => 'true',
      'returnFaceLandmarks' => 'false',
      'returnFaceAttributes' => 'age,gender,smile',
    })
    
    request = Net::HTTP::Post.new(uri.request_uri)
    # Request headers
    request['Content-Type'] = 'application/json'
    # NOTE: Replace the "Ocp-Apim-Subscription-Key" value with a valid subscription key.
    request['Ocp-Apim-Subscription-Key'] = 'c3862170741d4a8395d92b7f5b2fbab9'
    # Request body
    request.body = "{\"url\":\"https://newbeeton-yung94.c9users.io"+ @user.image.to_s + "\"}"
    
    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        http.request(request)
    end

    puts response.body
    ha = JSON.parse(response.body)
    faceattributes = ha.first["faceAttributes"]
    @emotion = faceattributes["smile"].to_f
    @gender = faceattributes["gender"]
    @age = faceattributes["age"]
  end
end
