# отправка сообщений
class ContactsController < ApplicationController

	def new
	end

	def create
    @contact=Contact.new(contact_params)

    # если новое сообщение валидно, оно записывается, иначе снова вызывается форма ввода
    if @contact.valid? then
      @contact.save
    else
      render action: 'new'
    end
	end

  private

  # разрешение передачи параметров
  def contact_params
    params.require(:contact).permit(:email, :message)
  end
	
end
