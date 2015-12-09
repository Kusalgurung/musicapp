
welcome = Artist.where(title: 'Welcome').first
welcome.delete if welcome
notes = Artist.create([title: 'Welcome', biography: 'To the musify app.'])