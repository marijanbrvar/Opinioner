module MainHelper
  def opinion_helper
     if @user.opinions.any?
      @opinions = @user.opinions.all.order(created_at: :desc)
     else
       content_tag(:p, 'No opinions yet!')
     end
  end
end
