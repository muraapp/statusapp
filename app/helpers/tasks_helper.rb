module TasksHelper
  def task_status(status)
  	if status == 1
      return "下書き"
    elsif status == 2
      return "公開"
    elsif status == 3
      return "編集済み"
    elsif status == 4
      return "論理削除"
    end
  end

  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_tasks_path
    elsif action_name == 'edit'
      task_path
    end
  end
end
