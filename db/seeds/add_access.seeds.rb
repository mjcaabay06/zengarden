AccessCategory.create!([
	{ description: 'Applications' }
])

Access.create!([
	{ access_category_id: 1, description: 'Reservations', url: '/admin/reservations' }
])