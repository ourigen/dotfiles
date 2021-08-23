require('orgmode').setup({
	org_hide_emphasis_markers = true,
	org_hide_leading_stars = true,
	org_priority_default = 'C',
	org_highlight_latex_and_related = 'entities',
	org_indent_mode = 'noindent',
	org_agenda_files = '~/sync/org/*',
	org_default_notes_file = '~/sync/org/inbox.org',
	org_agenda_min_height = 20,
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
	org_agenda_start_on_weekday = nil,  -- start agenda from current day
	org_agenda_skip_scheduled_if_done = true,
	org_agenda_skip_deadline_if_done = true,
	org_agenda_templates = {
		t = {
			description = 'Task',
			template = '* TODO %?\nSCHEDULED: %T' 
		},
		n = {
			description = 'Note',
			template = '* %? :NOTE:'
		},
		m = {
			description = 'Meeting',
			template = '* TODO Meet with %?\nSCHEDULED: %T'
		},
		e = {
			description = 'Edit',
			template = '* TODO Fix %? in %a\n/Entered on %U/' 
		},
	},
	mappings = {
		-- global = {
		-- 	org_agenda = 'gA',
		-- 	org_capture = 'gC'
		-- },
		agenda = {
			org_agenda_day_view = 'd',
			org_agenda_week_view = 'w',
			org_agenda_month_view = 'm',
			org_agenda_year_view = 'y'
		},
		-- capture = {
		-- 	org_capture_finalize = 'W',
		-- 	org_capture_refile = 'R',
		-- 	org_capture_kill = 'Q'
		-- },
		org = {
			org_todo = '<leader>mt',  -- open states menu
			org_todo_prev = '<A-l>',   -- cycle states
			org_deadline = '<leader>mdd',
			org_schedule = '<leader>mds',
			org_toggle_checkbox = '<leader>mx',
			org_meta_return = '<A-CR>',
			org_move_subtree_up = '<A-k>',
			org_move_subtree_down = '<A-j>',
			org_open_at_point = 'gx',
		}
	}
})
