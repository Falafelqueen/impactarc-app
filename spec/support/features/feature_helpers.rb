module Features
  def check_checkbox(value)
    find("input[type='checkbox'][value=#{value}]").click
  end
end
