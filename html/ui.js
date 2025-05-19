/*!
 * mbt_taxi
 * License: CC BY-NC-SA 4.0 – https://creativecommons.org/licenses/by-nc-sa/4.0/
 * Developed by Mordbite, 2025
 */

// =======================================================
// INIT
// =======================================================

let meterStarted = false;
let tourTimerInterval = null;

let currentMeterData = {
	defaultPrice: 3.50,
	currentFare: 0.00,
	distanceTraveled: 0.00,
	tour: {
		id: "-",
		fromDistrict: "-",
		fromStreet: "-",
		fromDetail: "-",
		toDistrict: "-",
		toStreet: "-",
		toDetail: "-",
	}
};

// =======================================================
// HELPER-FORMATTER
// =======================================================

function formatFareLCD(value) {
	return value.toFixed(2);
}

function formatPriceDistanceLCD(value) {
	return value.toFixed(2);
}

function formatTourInfo(text) {
	return text;
}

// =======================================================
// METER-UPDATES
// =======================================================


function updateUI() {
	$("#fare-value").html(formatFareLCD(currentMeterData.currentFare));
	$("#distance-value").html(formatPriceDistanceLCD(currentMeterData.distanceTraveled));
	$("#price-value").html(formatPriceDistanceLCD(currentMeterData.defaultPrice));

	$("#tourinfo-from-district").html(currentMeterData.tour.fromDistrict);
	$("#tourinfo-from-street").html(currentMeterData.tour.fromStreet);
	$("#tourinfo-from-detail").html(currentMeterData.tour.fromDetail);
	$("#tourinfo-to-district").html(currentMeterData.tour.toDistrict);
	$("#tourinfo-to-street").html(currentMeterData.tour.toStreet);
	$("#tourinfo-to-detail").html(currentMeterData.tour.toDetail);
}

// =======================================================
// METER CONTROL
// =======================================================


/**
 * Resets the current taximeter state to default values.
 * Clears fare, distance, and tour metadata, stops the meter,
 * and updates the UI to reflect the reset state.
 */
function resetMeter() {
	currentMeterData.currentFare = 0.0;
	currentMeterData.distanceTraveled = 0.0;
	currentMeterData.tour = {
		id: "-",
		fromDistrict: "-",
		fromStreet: "-",
		fromDetail: "-",
		toDistrict: "-",
		toStreet: "-",
		toDetail: "-"
	};
	meterStarted = false;
	updateMeterActiveStateLabel();
	updateUI();
}

/**
 * Initializes and displays the taximeter UI with provided data.
 * Sets current fare, distance, and tour information, applies defaults if missing,
 * and triggers a UI update with a fade-in animation.
 * @param {Object} meterData - Initial meter values including fare, distance, and tour metadata.
 */
function openMeter(meterData) {
	currentMeterData = {
		defaultPrice: meterData.defaultPrice || 3.5,
		currentFare: meterData.currentFare || 0.0,
		distanceTraveled: meterData.distanceTraveled || 0.0,
		tour: meterData.tour || {
			id: "-",
			fromDistrict: "-",
			fromStreet: "-",
			fromDetail: "-",
			toDistrict: "-",
			toStreet: "-",
			toDetail: "-"
		}
	};
	$(".taxameter").css("display", "block");
	$(".meter-container").stop(true, true).fadeIn(150, () => {
		updateUI();
	});
}


function closeMeter() {
	$(".taxameter").css("display", "none");
	$(".meter-container").fadeOut(150);
}

/**
 * [BETA] Updates the meter status label based on the active state.
 * Sets the UI label to "ACTIVE" if the meter is running, otherwise clears it.
 * Note: This system is currently under development and may not reflect actual state reliably.
 */

function updateMeterActiveStateLabel() {
	$("#active-label").html(meterStarted ? "ACTIVE" : "");
}

/**
 * Toggles the visibility and state of the taximeter UI.
 * Starts or stops the meter display, updates UI components accordingly,
 * and refreshes the active state label.
 */
function meterToggle() {
	meterStarted = !meterStarted;

	if (meterStarted) {
		$(".container").fadeIn(150);
		$(".meter-container").stop(true, true).fadeIn(150);
		$(".taxameter").css("display", "block");
		updateUI();
	} else {
		$(".meter-container").fadeOut(150);
		$(".taxameter").css("display", "none");
	}

	updateMeterActiveStateLabel();
}

// =======================================================
// TOUR HANDLING
// =======================================================

/**
 * SVG icon definitions used throughout the UI.
 * Each entry maps a logical key to an inline SVG string, allowing easy injection
 * into the DOM via innerHTML without needing external image files.
 *
 * Usage Example:
 *   document.getElementById("icon-slot").innerHTML = icons.userFilled;
 *
 * Note: These icons are intended to be styled with the 'icon' class and should
 * be used within elements that support inline SVG content.
 */
const icons = {
	userFilled: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" class="icon"><path d="M224 256A128 128 0 1 0 224 0a128 128 0 1 0 0 256zm-45.7 48C79.8 304 0 383.8 0 482.3C0 498.7 13.3 512 29.7 512l388.6 0c16.4 0 29.7-13.3 29.7-29.7C448 383.8 368.2 304 269.7 304l-91.4 0z"/></svg>`,
	userEmpty: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" class="icon"><path d="M304 128a80 80 0 1 0 -160 0 80 80 0 1 0 160 0zM96 128a128 128 0 1 1 256 0A128 128 0 1 1 96 128zM49.3 464l349.5 0c-8.9-63.3-63.3-112-129-112l-91.4 0c-65.7 0-120.1 48.7-129 112zM0 482.3C0 383.8 79.8 304 178.3 304l91.4 0C368.2 304 448 383.8 448 482.3c0 16.4-13.3 29.7-29.7 29.7L29.7 512C13.3 512 0 498.7 0 482.3z"/></svg>`,
	location: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512" class="icon"><path d="M215.7 499.2C267 435 384 279.4 384 192C384 86 298 0 192 0S0 86 0 192c0 87.4 117 243 168.3 307.2c12.3 15.3 35.1 15.3 47.4 0zM192 128a64 64 0 1 1 0 128 64 64 0 1 1 0-128z"/></svg>`,
	flag: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"class="icon"><path d="M32 0C49.7 0 64 14.3 64 32l0 16 69-17.2c38.1-9.5 78.3-5.1 113.5 12.5c46.3 23.2 100.8 23.2 147.1 0l9.6-4.8C423.8 28.1 448 43.1 448 66.1l0 279.7c0 13.3-8.3 25.3-20.8 30l-34.7 13c-46.2 17.3-97.6 14.6-141.7-7.4c-37.9-19-81.3-23.7-122.5-13.4L64 384l0 96c0 17.7-14.3 32-32 32s-32-14.3-32-32l0-80 0-66L0 64 0 32C0 14.3 14.3 0 32 0zM64 187.1l64-13.9 0 65.5L64 252.6 64 318l48.8-12.2c5.1-1.3 10.1-2.4 15.2-3.3l0-63.9 38.9-8.4c8.3-1.8 16.7-2.5 25.1-2.1l0-64c13.6 .4 27.2 2.6 40.4 6.4l23.6 6.9 0 66.7-41.7-12.3c-7.3-2.1-14.8-3.4-22.3-3.8l0 71.4c21.8 1.9 43.3 6.7 64 14.4l0-69.8 22.7 6.7c13.5 4 27.3 6.4 41.3 7.4l0-64.2c-7.8-.8-15.6-2.3-23.2-4.5l-40.8-12 0-62c-13-3.8-25.8-8.8-38.2-15c-8.2-4.1-16.9-7-25.8-8.8l0 72.4c-13-.4-26 .8-38.7 3.6L128 173.2 128 98 64 114l0 73.1zM320 335.7c16.8 1.5 33.9-.7 50-6.8l14-5.2 0-71.7-7.9 1.8c-18.4 4.3-37.3 5.7-56.1 4.5l0 77.4zm64-149.4l0-70.8c-20.9 6.1-42.4 9.1-64 9.1l0 69.4c13.9 1.4 28 .5 41.7-2.6l22.3-5.2z"/></svg>`
};

/**
 * Clears and populates the tour list container with rendered tour cards.
 * Iterates through the provided tour array and renders each entry into the UI.
 * @param {Array<Object>} tours - Array of tour objects to be displayed.
 */

function populateTourList(tours) {
	const list = document.getElementById("tour-list");
	list.innerHTML = "";

	tours.forEach(tour => renderTourCard(tour));
}

/**
 * Renders a single tour entry as an interactive card in the UI.
 * Builds the card's visual components including urgency indicator, passenger icons,
 * from/to location details, and a claim button. Appends the result to the tour list container.
 * @param {Object} tour - Tour data containing ID, urgency, passenger count, and location labels.
 */
function renderTourCard(tour) {
	const card = document.createElement('div');
	card.className = 'tourcard';

	const urgencyClass = `urgency-${tour.urgency}`;
	const urgencyHTML = `
		<div class="urgency-indicator ${urgencyClass}">${tour.urgency}</div>
	`;
	const maxSeats = 3;
	const filledSeats = Math.min(tour.npcs, maxSeats);
	const emptySeats = maxSeats - filledSeats;

	let passengerHTML = '';
	for (let i = 0; i < filledSeats; i++) {
	passengerHTML += icons.userFilled;
	}
	for (let i = 0; i < emptySeats; i++) {
		passengerHTML += icons.userEmpty;
	}

	const symbolsHTML = `
		<div class="tourlist-item-Symbols">
			${urgencyHTML}
			<div class="passenger-indicator">
				${passengerHTML}
			</div>
		</div>
	`;
	const fromToHTML = `
		<div class="tourlist-item-FromTo-Box">
			<div class="location-info">
				${icons.location}
				<span>${tour.from.LabelDistrict}, ${tour.from.LabelStreet}, ${tour.from.LabelDetail}</span>
			</div>
			<div class="location-info">
				${icons.flag}
				<span>${tour.to.LabelDistrict}, ${tour.to.LabelStreet}, ${tour.to.LabelDetail}</span>
			</div>
		</div>
	`;

	const buttonHTML = `
		<button class="claimButton" onclick="selectTour('${tour.id}')">Claim</button>
	`;

	card.innerHTML = symbolsHTML + fromToHTML + buttonHTML;
	document.getElementById('tour-list').appendChild(card);
}

/**
 * Sends the selected tour ID to the backend and closes the UI.
 * Posts the selected tour to the NUI callback endpoint for processing by the Lua side,
 * then closes all UI elements to return control to gameplay.
 * @param {string} tourId - The ID of the selected tour to claim.
 */
function selectTour(tourId) {
	$.post("https://mbt_taxi/selectTour", JSON.stringify({ id: tourId }));
	closeAllUI();
}

/**
 * Renders the summary view for a completed taxi tour.
 * Constructs a detailed breakdown of origin, destination, distance, urgency, passengers,
 * time constraints, earnings, and bonus, and injects the content into the summary container.
 * @param {Object} data - Summary data containing tour route info, metrics, and payout.
 */
function renderTourSummary(data) {
	const summaryContent = `
		<div class="tourlist-item-FromTo-Box">
			<div class="location-info">
				<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512" class="icon" alt="start">
					<path d="M215.7 499.2C267 435 384 279.4 384 192C384 86 298 0 192 0S0 86 0 192c0 87.4 117 243 168.3 307.2c12.3 15.3 35.1 15.3 47.4 0zM192 128a64 64 0 1 1 0 128 64 64 0 1 1 0-128z"/>
				</svg>
				<span>${data.from}</span>
			</div>
			<div class="location-info">
				<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" class="icon" alt="ziel">
					<path d="M32 0C49.7 0 64 14.3 64 32l0 16 69-17.2c38.1-9.5 78.3-5.1 113.5 12.5c46.3 23.2 100.8 23.2 147.1 0l9.6-4.8C423.8 28.1 448 43.1 448 66.1l0 279.7c0 13.3-8.3 25.3-20.8 30l-34.7 13c-46.2 17.3-97.6 14.6-141.7-7.4c-37.9-19-81.3-23.7-122.5-13.4L64 384l0 96c0 17.7-14.3 32-32 32s-32-14.3-32-32l0-80 0-66L0 64 0 32C0 14.3 14.3 0 32 0zM64 187.1l64-13.9 0 65.5L64 252.6 64 318l48.8-12.2c5.1-1.3 10.1-2.4 15.2-3.3l0-63.9 38.9-8.4c8.3-1.8 16.7-2.5 25.1-2.1l0-64c13.6 .4 27.2 2.6 40.4 6.4l23.6 6.9 0 66.7-41.7-12.3c-7.3-2.1-14.8-3.4-22.3-3.8l0 71.4c21.8 1.9 43.3 6.7 64 14.4l0-69.8 22.7 6.7c13.5 4 27.3 6.4 41.3 7.4l0-64.2c-7.8-.8-15.6-2.3-23.2-4.5l-40.8-12 0-62c-13-3.8-25.8-8.8-38.2-15c-8.2-4.1-16.9-7-25.8-8.8l0 72.4c-13-.4-26 .8-38.7 3.6L128 173.2 128 98 64 114l0 73.1zM320 335.7c16.8 1.5 33.9-.7 50-6.8l14-5.2 0-71.7-7.9 1.8c-18.4 4.3-37.3 5.7-56.1 4.5l0 77.4zm64-149.4l0-70.8c-20.9 6.1-42.4 9.1-64 9.1l0 69.4c13.9 1.4 28 .5 41.7-2.6l22.3-5.2z"/>
				</svg>
				<span>${data.to}</span>
			</div>
		</div>
		<br>
		<div class="content-box"><span id="distance-label">Distance</span><span id="distance-value">${data.distance} km</span></div>
		<div class="content-box"><span id="passengers-label">Passengers</span><span id="passengers-value">${data.passengers}</span></div>
		<div class="content-box"><span id="urgency-label">Urgency Level</span><span id="urgency-value">${data.urgency}</span></div>
		<br>
		<div class="content-box"><span id="timeTotal-label">Time Limit</span><span id="timeTotal-value">${data.timeLimit}</span></div>
		<div class="content-box"><span id="timeLeft-label">Time Left</span><span id="timeLeft-value">${data.timeLeft}</span></div>
		<br>
		<div class="content-box"><span id="baseEarnings-label">Base Earnings</span><span id="baseEarnings-value">${data.baseEarnings} $</span></div>
		<div class="content-box"><span id="bonus-label">Bonus</span><span id="bonus-value">${data.bonus} $</span></div>
		<br><hr>
		<div class="content-box"><span id="total-label">Total</span><span id="total-value">${data.earnings} $</span></div>
	`;
	document.getElementById("summary-content").innerHTML = summaryContent;
}

// =======================================================
// UI CONTROL
// =======================================================

function showPanel(name) {
	document.querySelector('.tourmenu').style.display = name === 'tourmenu' ? 'block' : 'none';
	document.querySelector('.summary').style.display = name === 'summary' ? 'block' : 'none';
	document.querySelector('.taxameter').style.display = name === 'meter' ? 'flex' : 'none';
}

function closeAllUI() {
	showPanel(null);
	$(".meter-container").fadeOut(150);
	closeMeter();
	$.post("https://mbt_taxi/closeUI");
}

// =======================================================
// TIMER
// =======================================================

/**
 * Starts or resets the countdown timer for urgency-based tours.
 * Updates the timer display every second in MM:SS format.
 * Automatically clears the interval when time reaches zero.
 *
 * @param {number} seconds - Total time in seconds for the countdown.
 */
function startUrgencyTimer(seconds) {
	clearInterval(tourTimerInterval);
	let timeLeft = seconds;
	tourTimerInterval = setInterval(() => {
		if (timeLeft <= 0) {
			$("#urgency-timer-value").html("00:00");
			clearInterval(tourTimerInterval);
			return;
		}

		const mins = Math.floor(timeLeft / 60);
		const secs = timeLeft % 60;
		$("#urgency-timer-value").html(`${mins.toString().padStart(2, "0")}:${secs.toString().padStart(2, "0")}`);
		timeLeft--;
	}, 1000);
}

/**
 * Stops the active urgency countdown timer and resets the display.
 * Clears the interval and sets the timer text to a neutral placeholder.
 */
function stopUrgencyTimer() {
	clearInterval(tourTimerInterval);
	$("#urgency-timer-value").html("--:--");
}

// =======================================================
// EVENTS
// =======================================================

/**
 * Main NUI event listener for communication between Lua and the browser UI.
 * Listens for `postMessage` events and dispatches UI actions based on the provided `data.action` string.
 * Handles meter lifecycle, UI panels, tour list population, timer control, and summary rendering.
 *
 * This listener acts as the primary bridge between the FiveM client script (Lua)
 * and the taximeter HTML/JS frontend, using `SendNUIMessage` <-> `postMessage`.
 */
$(document).ready(function () {
	window.addEventListener("message", (event) => {
		const data = event.data;

		switch (data.action) {

			case "openMeter":
				if (data.toggle) {
					openMeter(data.meterData);
				} else {
					meterStarted = false;
					updateMeterActiveStateLabel();
				}
				break;

			case "toggleMeter":
				meterToggle();
				break;

			case "updateMeter":
				currentMeterData.currentFare = data.meterData.currentFare;
				currentMeterData.distanceTraveled = data.meterData.distanceTraveled;
				updateUI();
				break;

			case "resetMeter":
				resetMeter();
				break;

			case "startMeter":
				openMeter({
					defaultPrice: data.meterData?.defaultPrice || 3.5,
					currentFare: data.meterData?.currentFare || 0.0,
					distanceTraveled: data.meterData?.distanceTraveled || 0.0,
					tour: {
						id: data.meterData?.tour?.id || "-",
						fromDistrict: data.meterData?.tour?.fromDistrict || "-",
						fromStreet: data.meterData?.tour?.fromStreet || "-",
						fromDetail: data.meterData?.tour?.fromDetail || "-",
						toDistrict: data.meterData?.tour?.toDistrict || "-",
						toStreet: data.meterData?.tour?.toStreet || "-",
						toDetail: data.meterData?.tour?.toDetail || "-"
					}
				});
				break;

			case "updateTimer":
				const r = data.remaining;
				const mins = Math.floor(r / 60);
				const secs = r % 60;
				$("#urgency-timer-value").html(`${mins.toString().padStart(2, "0")}:${secs.toString().padStart(2, "0")}`);
				break;

			case "openTourMenu":
				$(".container").fadeIn(150);
				showPanel("tourmenu");
				populateTourList(data.tours);
				break;

			case "showSummary":
				showPanel("summary");
				renderTourSummary(data);
				break;

			case "startTimer":
				startUrgencyTimer(data.duration);
				break;

			case "stopTimer":
				stopUrgencyTimer();
				break;

			case "closeAll":
				closeAllUI();
				break;

			case "copyToClipboard":
				const el = document.createElement("textarea");
				el.value = event.data.text;
				document.body.appendChild(el);
				el.select();
				document.execCommand("copy");
				document.body.removeChild(el);
				console.log("Text copied via execCommand fallback");
				showToast("Text copied");
				break;
		}
	});
});  


// =======================================================
// ESC-HANDLING
// =======================================================

/**
 * Global keyup listener to close the UI when Escape is pressed.
 * Ensures users can quickly exit the current panel or interaction context.
 */
document.addEventListener("keyup", function (e) {
	if (e.key === "Escape") {
		closeAllUI();
	}
});


function showToast(text) {
	const toast = $("<div class='toast'></div>").text(text);
	$("body").append(toast);
	toast.fadeIn(200).delay(1000).fadeOut(400, () => toast.remove());
}