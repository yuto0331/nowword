class VoicesController < ApplicationController
    layout 'application'
    def index
        # @header = 'TOP'
        # @footer = 
        # @msg = '一覧'
        
        @voices = Voice.all
    end
    
    def new
      if params[:back]
        @voice = Voice.new(voice_params)
      else
        @voice = Voice.new
      end
    end
    
    def create
        @voice = Voice.new(voice_params)
        if @voice.save
        redirect_to new_voice_path, notice: "投稿！"
        else
        render 'new'
        end
    end
    
    def show
        @voice = Voice.find(params[:id])
    end
    
    def edit
        @voice = Voice.find(params[:id])
    end
    
    def update
        @voice = Voice.find(params[:id])
        if @voice.update(voice_params)
        redirect_to voices_path, notice: "編集完了"
        else
        render 'edit'
        end
    end
    
    def destroy
        @voice = Voice.find(params[:id])
        @voice.destroy
        redirect_to voices_path, notice: "削除しました"
    end
    
    def confirm
        @voice = Voice.new(voice_params)
        render :new if @voice.invalid?
    end
        
        
    private
    def voice_params
    params.require(:voice).permit(:content)
    end
    
end
