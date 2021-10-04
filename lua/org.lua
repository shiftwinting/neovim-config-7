require('orgmode').setup({
    org_todo_keywords = {'TODO', 'WAITING', '|', 'DONE', 'DELEGATED'},
    org_todo_keyword_faces = {
        WAITING = ':foreground #f7768e :weight bold',
        DELEGATED = ':foreground #bb9af7 :slant italic :underline on',
        TODO = ':foreground  #2ac3de :underline on :slant italic',
        DONE = ':foreground  #7aa2f7 :underline on :slant italic' -- overrides builtin color for `TODO` keyword
    },
    org_agenda_files = {'~/Dropbox/org/*', '~/my-orgs/**/*'},
    org_default_notes_file = '~/Dropbox/org/refile.org',
    notifications = {
        enabled = false,
        cron_enabled = true,
        repeater_reminder_time = false,
        deadline_warning_reminder_time = false,
        reminder_time = 10,
        deadline_reminder = true,
        scheduled_reminder = true,
        notifier = function(tasks)
            local result = {}
            for _, task in ipairs(tasks) do
                utils.concat(result, {
                    string.format('# %s (%s)', task.category, task.humanized_duration),
                    string.format('%s %s %s', string.rep('*', task.level), task.todo, task.title),
                    string.format('%s: <%s>', task.type, task.time:to_string())
                })
            end

            if not vim.tbl_isempty(result) then
                require('orgmode.notifications.notification_popup'):new({content = result})
            end
        end,
        cron_notifier = function(tasks)
            for _, task in ipairs(tasks) do
                local title = string.format('%s (%s)', task.category, task.humanized_duration)
                local subtitle = string.format('%s %s %s', string.rep('*', task.level), task.todo, task.title)
                local date = string.format('%s: %s', task.type, task.time:to_string())

                -- Linux
                if vim.fn.executable('notify-send') then
                    vim.loop.spawn('notify-send', {args = {string.format('%s\n%s\n%s', title, subtitle, date)}})
                end

                -- MacOS
                if vim.fn.executable('terminal-notifier') then
                    vim.loop.spawn('terminal-notifier',
                                   {args = {'-title', title, '-subtitle', subtitle, '-message', date}})
                end
            end
        end
    }
})

require("org-bullets").setup {
    symbols = {"◉", "○", "✸", "✿"}
    -- or a function that receives the defaults and returns a list
}
