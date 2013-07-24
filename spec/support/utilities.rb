def fullTitle(pageTitle)
baseTitle = "Welcome to Parami Soft"
if pageTitle.empty?
	baseTitle
	else
	"#{baseTitle} | #{pageTitle}"
	end
end