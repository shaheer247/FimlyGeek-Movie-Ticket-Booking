var firstSeatLabel = 1;
var booked = !!localStorage.getItem('booked') ? $.parseJSON(localStorage.getItem('booked')) : [];
$(document).ready(function() {
	var sc;
	var $cart = $('#selected-seats'),
		$counter = $('#counter'),
		$total = $('#total'),
		sc = $('#bus-seat-map').seatCharts({


			map: [
				'fffff',
				'fffff',
				'fffff',
				'eeeee',
				'eeeee',
				'eeeee',
				'eeeee',
				'eeeee',
				'eeeee',
			],
			seats: {
				f: {
					price: 100,
					classes: 'silver-class', //your custom CSS class
					category: 'Silver Class'
				},
				e: {
					price: 150,
					classes: 'gold-class', //your custom CSS class
					category: 'Gold Class'
				}

			},
			naming: {
				top: false,
				getLabel: function(character, row, column) {
					return firstSeatLabel++;
				},
			},
			legend: {
				node: $('#legend'),
				items: [
					['f', 'available', 'Silver Class - ₹100'],
					['e', 'available', 'Gold Class - ₹150'],
					['f', 'unavailable', 'Already Booked']
				]
			},
			click: function() {
				if (this.status() == 'available') {
					//let's create a new <li> which we'll add to the cart items
					$('<li>' + this.data().category + ' Seat # ' + this.settings.label + ': <b>₹' + this.data().price + '</b> <a href="#" class="cancel-cart-item">[cancel]</a></li>')
						.attr('id', 'cart-item-' + this.settings.id)
						.data('seatId', this.settings.id)
						.appendTo($cart);

					/*
					 * Lets update the counter and total
					 *
					 * .find function will not find the current seat, because it will change its stauts only after return
					 * 'selected'. This is why we have to add 1 to the length and the current seat price to the total.
					 */
					$counter.text(sc.find('selected').length + 1);
					$total.text(recalculateTotal(sc) + this.data().price);

					return 'selected';

				} else if (this.status() == 'selected') {

					//update the counter
					$counter.text(sc.find('selected').length - 1);

					//and total
					$total.text(recalculateTotal(sc) - this.data().price);

					//remove the item from our cart
					$('#cart-item-' + this.settings.id).remove();

					//seat has been vacated
					return 'available';

				} else if (this.status() == 'unavailable') {
					//seat has been already booked
					return 'unavailable';
				} else {
					return this.style();
				}
			}
		});

	//this will handle "[cancel]" link clicks
	$('#selected-seats').on('click', '.cancel-cart-item', function() {
		//let's just trigger Click event on the appropriate seat, so we don't have to repeat the logic here
		sc.get($(this).parents('li:first').data('seatId')).click();
	});

	//let's pretend some seats have already been booked
	// sc.get(['1_2', '4_1', '7_1', '7_2']).status('unavailable');
	sc.get(booked).status('unavailable');

});

function recalculateTotal(sc) {
	var total = 0;

	//basically find every selected seat and sum its price
	sc.find('selected').each(function() {

		total += this.data().price;

	});

	return total;
}

/*

$(function() {
	$('#checkout-button').click(function() {
		var items = $('#selected-seats li')
		if (items.length <= 0) {
			alert("Please select atleast 1 seat first.")
			return false;
		}
		var selected = [];
		items.each(function(e) {
			var id = $(this).attr('id')
			id = id.replace("cart-item-", "")
			selected.push(id)
		})
		if (Object.keys(booked).length > 0) {
			Object.keys(booked).map(k => {
				selected.push(booked[k])
			})
		}
		localStorage.setItem('booked', JSON.stringify(selected))
		alert("Seats has been Reserved successfully.")
		location.reload()
	})
	$('#reset-btn').click(function() {
		if (confirm("are you sure to reset the reservation of seats?") === true) {
			localStorage.removeItem('booked')
			alert("Seats has been Reset successfully.")
			location.reload()
		}
	})
})

*/

$(function() {
	$('#checkout-button').click(function() {
		var items = $('#selected-seats li')
		if (items.length <= 0) {
			alert("Please select at least 1 seat first.")
			return false;
		}
		var selected = [];
		var totalPrice = 0;
		items.each(function(e) {
			var id = $(this).attr('id')
			id = id.replace("cart-item-", "")
			selected.push(id);
			var price = parseFloat($(this).find('b').text().replace("₹", ""));
			totalPrice += price;
		});
		// Pass selected seats and total price as URL parameters
		var params = "?seats=" + selected.join(",") + "&total=" + totalPrice;
		// Redirect to the confirmation page with the parameters
		window.location.href = "confirmation.html" + params;
	});
	$('#reset-btn').click(function() {
        if (confirm("are you sure to reset the reservation of seats?") === true) {
            localStorage.removeItem('booked')
            alert("Seats has been Reset successfully.")
            location.reload()
        }
    })

});





