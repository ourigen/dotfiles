require('orgmode').setup({
	org_hide_emphasis_markers = true,
	org_hide_leading_stars = true,
	org_priority_default = 'C',
	org_highlight_latex_and_related = 'entities',
	org_indent_mode = 'noindent',
	org_agenda_files = '~/sync/Notes/*',
	org_default_notes_file = '~/sync/Notes/inbox.org',
	org_agenda_span = 'week',
	org_todo_keywords = {
		'TODO(t)', 'NEXT(n)',
		'|',
		'DONE(d)', 'OVER(o)'
	},
	org_todo_keyword_faces = {
		TODO = ':foreground #F7768E :weight bold',
		NEXT = ':foreground #E0AF68 :weight bold',
		DONE = ':foreground #9ECE6A :weight bold',
		OVER = ':foreground #a9b1d6 :weight bold',
	},
	org_agenda_start_on_weekday = false,  -- start agenda from current day
	org_agenda_skip_scheduled_if_done = true,
	org_agenda_skip_deadline_if_done = true,
	org_agenda_templates = {
		t = {
			description = 'Task',
			template = '* TODO %?\n%T'
		},
		e = {
			description = 'Edit',
			template = '* TODO Fix %?\n%a\n%T'
		},
		n = {
			description = 'Note',
			template = '* %?\n%U',
			target = '~/sync/Notes/personal.org'
		},
		j = {
			description = 'Journal',
			template = '*** %<%d %B %Y>\n%U %?',
			target = '~/sync/Notes/personal.org'
		}
	},
	mappings = {
		org = {
			org_todo_prev = '<A-h>',   -- cycle states
			org_todo = '<leader>mt',  -- open states menu
			org_deadline = '<leader>mdd',  -- set deadline date
			org_schedule = '<leader>mds',  -- set scheduled date
			org_toggle_checkbox = '<leader>mx',
			org_meta_return = '<A-CR>',
			org_move_subtree_up = '<A-k>',
			org_move_subtree_down = '<A-j>',
			org_open_at_point = '<CR>'
		}
	}
})
