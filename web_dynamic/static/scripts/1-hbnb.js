document.addEventListener('DOMContentLoaded', function () {
    const amenities = {};

    function handleCheckboxChange(event) {
        const checkbox = event.target;

        if (checkbox.checked) {
            amenities[checkbox.dataset.id] = checkbox.dataset.name;
        } else {
            delete amenities[checkbox.dataset.id];
        }

        const amenitiesList = Object.values(amenities);

        const amenitiesHeader = document.querySelector('div.amenities > h4');
        amenitiesHeader.textContent = amenitiesList.length > 0 ? amenitiesList.join(", ") : "\u00A0"; // &nbsp;

        console.log(amenities);
    }

    // Attach change event listener to all checkboxes
    const checkboxes = document.querySelectorAll('input[type="checkbox"]');
    checkboxes.forEach(function (checkbox) {
        checkbox.addEventListener('change', handleCheckboxChange);
    });
});
