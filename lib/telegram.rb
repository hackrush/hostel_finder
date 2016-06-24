require 'telegrammer'

class Telegram
	
	def self.bot
		# http://telegram.me/HostelFinder_Bot
		Telegrammer::Bot.new('231001068:AAH51aXzwkFz1h-9ykk3yE1_-1VHwq7v3aU')
	end

	def self.reply_markup options = []
		Telegrammer::DataTypes::ReplyKeyboardMarkup.new(	
			keyboard: options,
			resize_keyboard: true
		)
	end

	def self.hide_keyboard
		reply_markup = Telegrammer::DataTypes::ReplyKeyboardHide.new(
			hide_keyboard: true
		)
	end

	def self.send_message chat_id, text, hide=false, options
		if hide
			rm = hide_keyboard
		else
			rm = reply_markup(options)
		end
		bot.send_message(chat_id: chat_id, text: text, reply_markup:rm)
	end

	def self.set_webhook url
		bot.set_webhook(url)
	end
end